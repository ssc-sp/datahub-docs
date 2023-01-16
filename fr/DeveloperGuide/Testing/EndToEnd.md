[_metadata_: remarks]:- "Automatically translated with DeepL. From: /DeveloperGuide/Testing/EndToEnd.md"

[_(draft documentation, please review)_](/DeveloperGuide/Testing/EndToEnd.md)

# Test de bout en bout

Ce document résume le flux de travail pour les tests automatisés de bout en bout.

## Objectif

Exécuter une série de tests automatisés à partir des pipelines Azure Devops contre l'instance de dev dans Azure pour valider l'utilisation des clés.

## Authentification

Le pipeline sera exécuté en tant que service principal.

L'authentification actuelle de l'application s'appuie sur [MS Identity] (https://learn.microsoft.com/en-us/azure/active-directory/develop/v2-app-types#web-apps).

- [ ] La plateforme MS Identity actuelle peut-elle être utilisée avec le Service Principal ?
- Y a-t-il des paramètres qui peuvent être ajoutés à la plate-forme d'identité de MS actuelle pour permettre l'authentification des principaux services ?
-

[Flux OAuth de Microsoft] (https://learn.microsoft.com/en-us/azure/active-directory/develop/v2-oauth2-implicit-grant-flow#suitable-scenarios-for-the-oauth2-implicit-grant)

## Étapes d'authentification

1. Connectez-vous au service principal en utilisant l'identifiant et le secret du client.
1. Demander un jeton d'accès azur à l'instance de dev datahub
1. Authentifiez-vous avec un jeton d'accès au portail datahub.
1. Pages d'accès

``mermaid``

organigramme TD

    A[Connexion avec le principal du service en utilisant l'identifiant et le secret du client] -->
    B[Demande de jeton d'accès azur à l'instance de dev datahub] -->
    C[Authentifier avec un jeton d'accès au portail datahub] -->
    D [Pages d'accès]

```

## Ressources

[Application démon qui appelle les API web] (https://learn.microsoft.com/en-us/azure/active-directory/develop/scenario-daemon-app-registration)

[Service Principal authentication](https://learn.microsoft.com/en-us/azure/developer/java/sdk/identity-service-principal-auth)

[Blazor custom AuthenticationStateProvider](https://learn.microsoft.com/en-us/aspnet/core/blazor/security/server/?view=aspnetcore-7.0&tabs=visual-studio)

[Appeler l'API Web à partir d'un démon] (https://learn.microsoft.com/en-us/azure/active-directory/develop/scenario-daemon-call-api?tabs=dotnet)

[Ajouter des rôles aux applications] (https://learn.microsoft.com/en-us/azure/active-directory/develop/howto-add-app-roles-in-azure-ad-apps#declare-roles-for-an-application)

[Mettre en œuvre RBAC pour les applications] (https://learn.microsoft.com/en-us/azure/active-directory/develop/howto-implement-rbac-for-apps)

[Enregistrement de l'API Web protégé] (https://learn.microsoft.com/en-us/azure/active-directory/develop/scenario-protected-web-api-app-registration#if-your-web-api-is-called-by-a-service-or-daemon-app)
