# Workspaces and Apps

A workspace may contain one app. The app will be reverse proxied using [YARP](https://microsoft.github.io/reverse-proxy/).

Only members and admins of a workspace will be allowed to access the proxied app. A middleware will be in charge of enforcing this rule.

## Settings in the Portal

```
"ReverseProxy": {
    "Enabled": true,
    "BasePath":  "wsapp",
    "UserHeaderName": "dh-user"
  }  
```