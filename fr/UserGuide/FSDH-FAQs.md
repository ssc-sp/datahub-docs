---
remarks: Automatically translated with DeepL
source: /UserGuide/FSDH-FAQs.md
---

_(draft documentation, please review)_

## 1. Quels sont les 2 cas d'utilisation dans ce Proof-of-Concept ?
 ![image](https://user-images.githubusercontent.com/99416857/219882481-a871d9aa-d8ba-49e4-bf52-dbb9414b0005.png)

## 2. Quelles sont les capacités à utiliser et à évaluer pendant le PoC ?
- Stockage en nuage
- Partage des données
- Collaboration dans les cahiers

## 3. Où les données "vivent" ?
- Le cloud Azure de SSC - hébergé au Canada.

## 4. qu'adviendra-t-il des données à la fin de la chronologie du PoC ?
- Les options sont de supprimer/détruire ou de migrer vers un autre environnement spécifié par l'utilisateur.

## 5. Qu'est-ce qu'un compte de stockage Azure ?
- Il existe deux types principaux de comptes de stockage - ceux-ci sont activés par le SSC et l'accès fourni par l'équipe FSDH :
  - i. Azure Data Lake Storage (Gen2) - conçu pour l'analyse des big data et fournissant des listes de contrôle d'accès au niveau des fichiers et des dossiers.
  - ii. Azure Blob Storage - compte de stockage de base - ne fournit pas de contrôle d'accès au niveau des fichiers et des dossiers mais est requis pour la compatibilité dans certains scénarios.

## 6. Aurai-je des problèmes à utiliser le FSDH avec le VPN ?
- Vous devrez peut-être vous déconnecter de votre VPN pour télécharger des fichiers.

## 7. Que se passe-t-il si j'ai besoin de plus que les 5 To alloués ou de crédits de cloud supplémentaires ?
- Pour le PoC, nous essayons de limiter la taille des fichiers et de respecter les budgets alloués. Cependant, si vous pensez avoir besoin de plus de stockage ou de crédits, veuillez ouvrir un dossier avec le [FSDH Support Request Form] (https://forms.office.com/r/zk82ehvUtv) et votre demande sera examinée.  

## 8. Quels sont les types de coûts que mon projet d'analyse peut engendrer ?
- À un niveau élevé, les coûts de votre projet dépendront des 3 facteurs suivants :
  - Compute - le type de machines virtuelles (Clusters Databricks) dont vous avez besoin pour le projet.
  - Stockage - la quantité de données stockées à l'aide du service Blob Storage.
  - Coût de tout service supplémentaire dont vous pourriez avoir besoin pour votre projet, comme le coût des licences pour Power BI, Tableau, SQL Sever Database, etc.

## 9. Où puis-je voir le modèle de calcul des coûts pour les services ? Comment puis-je suivre les coûts encourus pour mon projet ?
- Des rapports et des alertes seront configurés pour vous permettre de suivre l'utilisation et le coût des services consommés dans votre espace de travail.

## 10. Qu'est-ce que le programme scientifique de Services partagés Canada ?
- La SSC a créé le Programme scientifique pour soutenir les priorités du GC sur la modernisation et la sécurisation de la recherche au Canada et pour mieux permettre aux scientifiques de disposer d'une infrastructure et de services numériques pour soutenir leurs mandats respectifs. Une priorité clé est d'aborder et d'éliminer les obstacles qui entravent la collaboration entre les MOVS.

## 11. Qu'est-ce que l'équipe Data Solutions for Science (DSS) ?
- L'équipe du MAS du programme scientifique a pour mandat de fournir des solutions de données fédérales aux ministères et organismes à vocation scientifique (MOVS) afin de relever les défis communs en matière de données et de renforcer la position de la science fédérale au Canada. De plus, nous cherchons à éliminer l'investissement continu dans des solutions ministérielles cloisonnées qui ne répondent pas aux besoins de la communauté scientifique du GC.  

## 12. Pourquoi une preuve de concept ?
- Un PoC permet l'innovation et l'itération à mesure que nous découvrons et testons les capacités des solutions de données qui donneront aux scientifiques les outils dont ils ont besoin pour répondre à leurs exigences en matière de gestion des données, de stockage, d'analyse avancée et de collaboration.
