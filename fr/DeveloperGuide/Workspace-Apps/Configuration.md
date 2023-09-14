---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Workspace-Apps/Configuration.md
draft: true
---

# Espaces de travail et applications

Un espace de travail peut contenir une application. L'application fera l'objet d'une procuration inverse à l'aide de [YARP](https://microsoft.github.io/reverse-proxy/).

Seuls les membres et les administrateurs d'un espace de travail seront autorisés à accéder à l'application mandatée. Un middleware sera chargé de faire respecter cette règle.

## Paramètres du portail

```
"ReverseProxy" : {
    "Activé" : vrai,
    "BasePath" :  "wsapp",
    "UserHeaderName" : "dh-user"
  }  
```
