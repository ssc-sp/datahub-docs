---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Workspace-Apps/Configuration.md
draft: true
---

# Espaces de travail et applications

Un espace de travail peut contenir une application. L'application fera l'objet d'une procuration inverse à l'aide de [YARP](https://microsoft.github.io/reverse-proxy/).

Seuls les membres et les administrateurs d'un espace de travail seront autorisés à accéder à l'application mandatée. Un middleware sera chargé de faire respecter cette règle.

>Les applications de l'espace de travail seront configurées statiquement dans la configuration du portail Datahub (pour l'instant).

Voici un exemple de configuration de l'une de ces applications.

**Configuration pour transférer tout le trafic pour l'application de l'espace de travail DIE1**.

```
"ReverseProxy" : {
    "Routes" : {
      "route1" : {
        "ClusterId" : "cluster1",
        "Match" : {
          "Path" : "/wsapp/die1/{**catch-all}"
        }
      }
    },
    "Clusters" : {
      "cluster1" : {
        "Destinations" : {
          "destination1" : {
            "Adresse" : "https://fsdh-proj-ncco-shiny-app-test.azurewebsites.net/"
          }
        }
      }
    }
  }
```
Cette configuration fera en sorte que toute requête envoyée à : https://datahub-portal-url/wsapp/die1/ sera transmise à https://fsdh-proj-ncco-shiny-app-test.azurewebsites.net/ via le reverse-proxy.
