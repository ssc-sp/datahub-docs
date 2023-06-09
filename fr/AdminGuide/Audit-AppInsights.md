---
remarks: Translation reviewed by DataHub team
source: /AdminGuide/AppInsights-Auditing.md
draft: true
---

## Comment interroger Datahub Appights ?

- Portail Azure ouvert
- Dans la boîte des ressources de recherche, collez "Application Insights".
- Cliquez sur le lien "Application Insights". Une liste s'affiche dans la partie gauche de l'écran.
- Dans la liste résultante, sélectionnez l'Application Insights correcte, par exemple pour VdP Portal, il s'agit de "fsdh-app-insights-portal-dev".
- Après avoir sélectionné les App Insights souhaités, masquer la liste (facultatif)
- Sélectionnez l'onglet "Logs" ou sélectionnez l'option "Logs" dans la section Surveillance du menu de gauche. C'est la même chose.
- Fermez les fenêtres de requêtes qui apparaîtront, nous n'en avons pas besoin.
- Vous pouvez maintenant saisir et exécuter des requêtes, dont les exemples sont présentés ci-dessous.

## Comment lister tous les événements d'un utilisateur spécifique ?

Type :

```
événements personnalisés
| where customDimensions.userName == "FULL_USER_NAME"

```

Ou

```
événements personnalisés
| où customDimensions.userName contient "A_NAME"

```

## Comment répertorier les événements de données ?

```
événements personnalisés
| où nom == "DataEvent"
```

Les filtres peuvent être combinés avec des clauses "where" supplémentaires, par exemple, tous les événements de données pour un utilisateur nommé "John"

```
événements personnalisés
| où customDimensions.userName contient "A_NAME"
| où nom == "DataEvent"
```

Les DataEvents sont des modifications apportées à la base de données en rapport avec les actions effectuées par l'utilisateur connecté.

Remarque : nous stockons les propriétés liées à l'événement dans les customDimensions de l'événement. Par exemple, nous stockons les propriétés liées à l'événement dans les customDimensions de l'événement :
```
	AspNetCoreEnvironment : dev
	changeType : Supprimer
	objectId : MetadataProfile {ProfileId : 4} Supprimé
	table : MetadataProfile
	userId : 34a16480-1c78-4b65-933f-c6cce336346b
	Nom d'utilisateur : Iroel Perez-Garcia
	userPrincipalName : iperez_apption.com#EXT#@163oxygen.onmicrosoft.com
```


