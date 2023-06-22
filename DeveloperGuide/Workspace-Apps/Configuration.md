# Workspaces and Apps

A workspace may contain one app. The app will be reverse proxied using [YARP](https://microsoft.github.io/reverse-proxy/).

Only members and admins of a workspace will be allowed to access the proxied app. A middleware will be in charge of enforcing this rule.

>Workspace apps will be configure statically in the Datahub Portal configuration (for now). 

The following is an example of how to configure one of these apps.

**Configuration to forward all traffic for the DIE1 workspace app**

```
"ReverseProxy": {
    "Routes": {
      "route1": {
        "ClusterId": "cluster1",
        "Match": {
          "Path": "/wsapp/die1/{**catch-all}"
        }
      }
    },
    "Clusters": {
      "cluster1": {
        "Destinations": {
          "destination1": {
            "Address": "https://fsdh-proj-ncco-shiny-app-test.azurewebsites.net/"
          }
        }
      }
    }
  }
```
This configuration will make any request sent to: https://datahub-portal-url/wsapp/die1/ to be forwarded to https://fsdh-proj-ncco-shiny-app-test.azurewebsites.net/ via the reverse-proxy.
