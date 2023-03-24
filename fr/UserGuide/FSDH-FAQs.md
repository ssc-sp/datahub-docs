---
remarks: Automatically translated with DeepL
source: /UserGuide/FSDH-FAQs.md
draft: true
---

## Quelles sont les capacités à utiliser et à évaluer pendant la PoC ?
- Stockage en nuage
- Partage des données
- Collaboration dans les cahiers

## Où se trouvent les données ?
Azure Cloud de SSC - hébergé au Canada.

## Qu'adviendra-t-il des données à la fin de la durée du PoC ?
Les options sont de supprimer/détruire ou de migrer vers un autre environnement spécifié par l'utilisateur.

## Qu'est-ce qu'un compte de stockage Azure ?
Il existe deux types de comptes de stockage : ceux qui sont activés par le CSP et ceux dont l'accès est fourni par l'équipe de la FSDH :
  - i. Azure Data Lake Storage (Gen2) - conçu pour l'analyse des big data et fournissant des listes de contrôle d'accès au niveau des fichiers et des dossiers.
  - ii. Azure Blob Storage - compte de stockage de base - ne fournit pas de contrôle d'accès au niveau des fichiers et des dossiers mais est requis pour la compatibilité dans certains scénarios.

## Aurai-je des difficultés à utiliser la FSDH avec le VPN ?
Il se peut que vous deviez vous déconnecter de votre VPN pour charger ou télécharger des fichiers.

## Que se passe-t-il si j'ai besoin de plus que les 5 To alloués ou de crédits cloud supplémentaires ?
Pour le PoC, nous essayons de limiter la taille des fichiers et de rester dans les limites des budgets alloués. Cependant, si vous pensez avoir besoin de plus d'espace de stockage ou de crédits, veuillez ouvrir un dossier avec le [FSDH Support Request Form] (/UserGuide/FSDH-Support-Request-Form.md) et votre demande sera examinée.  

## Quels sont les types de coûts que mon projet d'analyse peut engendrer ?
En général, les coûts de votre projet dépendent des trois facteurs suivants :
  - Compute - le type de machines virtuelles (Clusters Databricks) dont vous avez besoin pour le projet.
  - Stockage - la quantité de données stockées à l'aide du service Blob Storage.
  - Coût de tout service supplémentaire dont vous pourriez avoir besoin pour votre projet, comme le coût des licences pour Power BI, Tableau, SQL Sever Database, etc.

## Où puis-je voir le modèle de calcul des coûts pour les services ? Comment puis-je suivre les coûts encourus pour mon projet ?
Des rapports et des alertes seront configurés pour vous permettre de suivre l'utilisation et le coût des services consommés dans votre espace de travail.

## Qu'est-ce que le programme scientifique de Services partagés Canada ?
La SSC a créé le programme scientifique pour soutenir les priorités du gouvernement en matière de modernisation et de sécurisation de la recherche au Canada et pour permettre aux scientifiques de disposer d'une infrastructure et de services numériques leur permettant de remplir leurs mandats respectifs. L'une des principales priorités est d'éliminer les obstacles qui entravent la collaboration entre les organismes de recherche scientifique et technique.

## Qu'est-ce que l'équipe Data Solutions for Science (DSS) ?
L'équipe DSS du Programme scientifique a pour mandat de fournir des solutions de données fédérales aux ministères et organismes à vocation scientifique (MOVS) afin de relever les défis communs en matière de données et de renforcer la position de la science fédérale au Canada. En outre, nous cherchons à éliminer les investissements continus dans des solutions ministérielles cloisonnées qui ne répondent pas aux besoins de la communauté scientifique du GC.  

## Pourquoi une preuve de concept ?
Un PoC permet l'innovation et l'itération au fur et à mesure que nous découvrons et testons les capacités des solutions de données qui donneront aux scientifiques les outils dont ils ont besoin pour répondre à leurs besoins en matière de gestion, de stockage, d'analyse avancée et de collaboration des données.
