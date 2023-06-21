---
remarks: Translation reviewed by DataHub team
source: /DeveloperGuide/Costing/README.md
draft: true
---

# Fonction de calcul des coûts

Fonction en anglais :

> Récupérer le coût de la veille d'un projet auprès du fournisseur de services en nuage et le stocker dans la base de données.

> Généré par l'IA
> Azure Consumption API query endpoint `https://management.azure.com/subscriptions/{subscriptionId}/providers/Microsoft.Consumption/usageDetails?api-version=2019-10-01&$filter=properties/usageEnd le '2020-10-01T00:00:00Z' and properties/usageStart ge '2020-09-30T00:00:00Z'`.

https://learn.microsoft.com/en-us/rest/api/consumption/usage-details/list?tabs=HTTP

``mermaid``

classDiagram

    class Project_Costs {
        +int Id
        +int ProjectId

        +datetime Date
        +décimal CadCost
        +Chaîne de caractères Nom du service
        +Chaîne CloudProvider
    }

```
