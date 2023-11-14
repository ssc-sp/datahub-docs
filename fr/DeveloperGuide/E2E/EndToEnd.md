---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/E2E/EndToEnd.md
draft: true
---

# Test de bout en bout

Ce document résume le flux de travail pour les tests automatisés de bout en bout de l'application Datahub.

## Objectif

L'objectif des tests E2E est de tester l'application du point de vue de l'utilisateur. Le test sera exécuté à partir de l'interface utilisateur et simulera l'interaction de l'utilisateur avec l'application.

## Authentification

L'authentification actuelle de l'application s'appuie sur [MS Identity] (https://learn.microsoft.com/en-us/azure/active-directory/develop/v2-app-types#web-apps) avec OIDC.


### Étapes d'authentification

> Note : jusqu'à ce que Keycloak soit intégré, il y aura une étape manuelle pour se connecter à l'application.

1. Lancer le portail en arrière-plan (on peut utiliser le script `dh-portal`)
1. Configurer les identifiants dans la configuration
```json
{
  "BaseUrl" : "https://localhost:5001",
  "Headless" : "false",
  "SlowMo" : "2000",
  "admin_user" : "<admin-test-email>",
  "admin_password" : "<admin-test-pw>",
  "user_name" : "<user-test-email>",
  "password" : "<utilisateur-test-pw>"
}
```
3. Exécuter les tests E2E


## Authentification future

L'authentification future s'appuiera sur [Keycloak] (https://www.keycloak.org/). Les étapes suivantes seront nécessaires pour se connecter à l'application :

1. Lancer le portail en arrière-plan (on peut utiliser le script `dh-portal`)
1. Configurer les identifiants dans la configuration
1. Exécuter les tests E2E
