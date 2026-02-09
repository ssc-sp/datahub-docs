# Dev Auth for Simulating GCCF Logins

This document explains how to enable the development authentication flow that simulates a GCCF external user.
The goal is:

- To log in locally without GCCF
- While exercising the **same** authorization path as real GCCF users:
 - ASP.NET Core authentication
 - [`RoleClaimTransformer`](https://github.com/ssc-sp/datahub-portal/blob/develop/Portal/src/Datahub.Application/RoleManagement/RoleClaimTransformer.cs)
 - Workspace role resolution from the DB

## How to use dev auth locally

1. Edit `appsettings.json` and set `GccfOidc:DevAuth:UserEmail` (and optional `UserName`, `Workspaces`).
2. Run the portal in Development.
3. On startup, `DevAuthDBEntities.EnsureDevUserAsync` seeds the dev user and roles and adds them to the local database
4. Requests authenticate via `DevAuthHandler`; `RoleClaimTransformer` runs.
5. Blazor components get the transformed claims through `ServerAuthenticationStateProvider`.

To disable dev auth, clear or remove `GccfOidc:DevAuth:UserEmail` and restart the app.

## Components

Dev auth is composed of:

- `DevAuthHandler` (custom auth handler / scheme)
- `DevAuthDBEntities` (DB bootstrap for the dev GCCF user and roles)
- `DevAuthOptions` (configuration values)
- Wiring in `Startup` and `ConfigureAuthenticationServices`

When enabled, all local requests authenticate as a fixed GCCF-like external user and Blazor reads this identity from the normal server auth pipeline.

## Configure `appsettings.json`

In [`Portal/src/Datahub.Portal/appsettings.json`](https://github.com/ssc-sp/datahub-portal/blob/develop/Portal/src/Datahub.Portal/appsettings.json), add a `GccfOidc:DevAuth` section:

```json
{
 "GccfOidc": {
 "DevAuth": {
 "UserEmail": "dev.user@example.com",
 "UserName": "Dev GCCF User",
 "Workspaces": [ "PRJ1", "PRJ2" ]
 }
 }
}
```

- `UserEmail` (required to enable dev auth)
  - If this is empty or missing, dev auth is disabled and the portal uses normal auth.
- `UserName` (optional)
  - If omitted, the email is used as display name.
- `Workspaces` (optional, list of acronyms)
  - For each listed acronym, the dev user gets a default **Web App and Storage** external role if the workspace exists in the DB.

## How `DevAuthHandler` works

File: [`Portal/src/Datahub.Application/Authentication/DevAuthHandler.cs`](https://github.com/ssc-sp/datahub-portal/blob/develop/Portal/src/Datahub.Application/Authentication/DevAuthHandler.cs)

- Implemented as an ASP.NET Core authentication scheme `"DevAuth"`.
- Reads `GccfOidc:DevAuth:UserEmail` and `UserName` from configuration.
- If `UserEmail` is empty:
 - Returns `AuthenticateResult.NoResult()` (no effect).
- If set, issues a `ClaimsPrincipal` with:
 - `ClaimTypes.Name` / `ClaimTypes.Email`
 - `ClaimTypes.NameIdentifier` and `ClaimConstants.ObjectId` set to `DevelopmentAuthStateProvider.DevUserObjectId`
 - Role: `RoleConstants.EXTERNAL_LOGIN`
 - IDP qualifier: `RoleClaimTransformer.IDP_QUALIFIER_CLAIM = "https://te.clegc-gckey.gc.ca"`

This principal is then passed through `RoleClaimTransformer` like a normal GCCF user.

### Server-side wiring (authentication)

File: [`Portal/src/Datahub.Portal/Services/Auth/ConfigureAuthenticationServices.cs`](https://github.com/ssc-sp/datahub-portal/blob/develop/Portal/src/Datahub.Portal/Services/Auth/ConfigureAuthenticationServices.cs)

Method: `ConfigureAuthenticationServices.AddAuthenticationServices`

- Reads `devAuthEmail = configuration["GccfOidc:DevAuth:UserEmail"]`.
- If non-empty, sets default ASP.NET Core authentication scheme to `"DevAuth"`:

```csharp
options.DefaultScheme = DevAuthHandler.Scheme;
options.DefaultAuthenticateScheme = DevAuthHandler.Scheme;
options.DefaultSignInScheme = DevAuthHandler.Scheme;
options.DefaultChallengeScheme = DevAuthHandler.Scheme;
```

- Still registers `AddMicrosoftIdentityWebApp` and GCCF schemes for normal auth.
- Registers the dev scheme:

```csharp
services.AddAuthentication()
 .AddScheme<AuthenticationSchemeOptions, DevAuthHandler>(DevAuthHandler.Scheme, _ => { });
```

- `RoleClaimTransformer` is registered as `IClaimsTransformation` and will run on the dev principal.

### Database bootstrap for the dev user

File: [`Portal/src/Datahub.Application/Authentication/DevAuthDBEntities.cs`](https://github.com/ssc-sp/datahub-portal/blob/develop/Portal/src/Datahub.Application/Authentication/DevAuthDBEntities.cs)

Method: `DevAuthDBEntities.EnsureDevUserAsync`

1. Skips work if `UserEmail` is empty.
2. Uses a fixed dev object id `DevelopmentAuthStateProvider.DevUserObjectId`.
3. Creates/loads an `ExternalUser` with:
   - `ExternalSubject = devOid`
   - Nested `PortalUser` with `Email` and `DisplayName` from config.
4. Ensures the `PortalUser` is linked back to the external user:

```csharp
externalUser.PortalUser.ExternalUser = externalUser;
await ctx.SaveChangesAsync(cancellationToken);
```

5. For each configured workspace acronym in `DevAuthOptions.Workspaces`:
   - Looks up the `Datahub_Project`.
   - If there is no existing `UserRoleLinks` for that portal user + project, adds one with role `Project_Role.RoleNames.WebAppAndStorage`.

This ensures the dev GCCF user exists in the portal DB and has workspace roles that `RoleClaimTransformer` can translate into claims.

### Startup wiring (Blazor & bootstrap)

File: [`Portal/src/Datahub.Portal/Startup.cs`](https://github.com/ssc-sp/datahub-portal/blob/develop/Portal/src/Datahub.Portal/Startup.cs)

In `ConfigureServices`:

```csharp
var devAuthSection = Configuration.GetSection("GccfOidc:DevAuth");
var devAuthUserEmail = devAuthSection.GetValue<string>("UserEmail");
if (!string.IsNullOrWhiteSpace(devAuthUserEmail))
{
 services.Configure<DevAuthOptions>(devAuthSection);
 services.AddScoped<DevAuthDBEntities>();
 services.AddScoped<AuthenticationStateProvider, ServerAuthenticationStateProvider>();
}
```

- Only when `UserEmail` is configured:
 - `DevAuthOptions` is bound.
 - `DevAuthDBEntities` is registered.
 - Blazor `AuthenticationStateProvider` uses `ServerAuthenticationStateProvider` (reads `HttpContext.User`).

### Running the bootstrapper

In `Configure`:

```csharp
var devAuthSection = configuration.GetSection("GccfOidc:DevAuth");
var devAuthUserEmail = devAuthSection.GetValue<string>("UserEmail");
if (env.IsDevelopment() && !string.IsNullOrWhiteSpace(devAuthUserEmail))
{
 using var scope = services.CreateScope();
 var bootstrapper = scope.ServiceProvider.GetRequiredService<DevAuthDBEntities>();
 bootstrapper.EnsureDevUserAsync().GetAwaiter().GetResult();
}
```

- Runs only in Development and only if `DevAuth:UserEmail` is set.
- Ensures the dev user and workspace roles exist at startup.

