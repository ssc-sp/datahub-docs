# Les tableaux de bord sur Databricks comparés à d'autres outils

Databricks, PowerBI et Tableau sont tous des outils puissants utilisés pour l'analyse et la visualisation des données, mais ils ont des objectifs et des capacités différents, en particulier en ce qui concerne les tableaux de bord. Cet article compare les capacités de Databricks sur le DHSF, PowerBI et Tableau en matière de tableaux de bord.

## Databricks

**L'objectif est de créer une plateforme d'analyse de données avec un accent particulier sur le traitement des données massives, l'apprentissage automatique et la science des données collaborative.

**Dashboarding:**

* Intégration avec les carnets de notes : Les tableaux de bord sont créés à partir de carnets de notes, qui peuvent contenir un mélange de code, de visualisations et de texte narratif.
* Données en temps réel : Grâce à son architecture basée sur Spark, Databricks peut gérer le traitement des données en temps réel et afficher des données en direct sur des tableaux de bord.
* Collaboration : Permet de travailler en collaboration sur des carnets de notes, qui peuvent ensuite être partagés en tant que tableaux de bord au sein d'une équipe ou d'une organisation.
* Personnalisation : Limitée par rapport aux outils de BI spécialisés ; cependant, elle prend en charge diverses bibliothèques de visualisation qui peuvent être utilisées dans les carnets (par exemple, Matplotlib ou Plotly).
* Interactivité : Les tableaux de bord peuvent être interactifs dans une certaine mesure, mais l'interactivité est généralement plus limitée que dans PowerBI ou Tableau. Les tableaux de bord peuvent utiliser des widgets Python pour des entrées interactives.

## PowerBI

**Focus:** Un service d'analyse commerciale de Microsoft qui fournit aux utilisateurs professionnels des outils d'agrégation, d'analyse, de visualisation et de partage des données.

**Dashboarding:**

* Facilité d'utilisation : Connu pour son interface conviviale et ses fonctions de glisser-déposer qui facilitent la création de tableaux de bord.
* Connectivité des données : Offre de solides options de connectivité avec diverses sources de données et une forte intégration avec d'autres produits Microsoft.
* Interactivité : Tableaux de bord hautement interactifs avec des capacités d'exploration et des options de filtrage étendues.
* Données en temps réel : Prend en charge les tableaux de bord en temps réel avec des ensembles de données en continu.
* Visuels personnalisés : Une vaste bibliothèque de visuels et la possibilité d'importer des visuels personnalisés du marché ou de créer les vôtres.

## Tableau

**Le but est d'aider les utilisateurs à créer des tableaux de bord interactifs et faciles à partager.

**Dashboarding:**

* Capacités de visualisation : Connu pour ses fortes capacités de visualisation de données avec un large éventail de diagrammes et de graphiques.
* Expérience utilisateur : Interface intuitive et conviviale qui prend en charge les fonctionnalités de glisser-déposer.
* Traitement des données : Peut traiter de grands volumes de données et se connecter à diverses sources de données.
* Interactivité : Offre une grande interactivité grâce à des fonctionnalités telles que les infobulles, les filtres et les paramètres qui peuvent être utilisés pour créer des tableaux de bord très dynamiques.
* Communauté et ressources : La communauté est vaste et active et propose une multitude de ressources, de modèles et de forums d'assistance.

## Comparaison

| **Feature** | **Databricks** | **PowerBI** | **Tableau** |
| --------------------------- | --------------------------------------------------------------------------------- | --------------------------------------------------------- | ------------------------------------------------------------ |
| **Objectif principal** | Science des données et analyse des grandes données | Intelligence économique et analyse des données | Visualisation des données et intelligence économique |
| **Facilité d'utilisation** | Nécessite des connaissances en programmation | Interface conviviale, intuitive et fonctionnalités de glisser-déposer | Interface conviviale, intuitive et fonctionnalités de glisser-déposer |
| **Données en temps réel** | Gère le traitement des données en temps réel | Prend en charge les tableaux de bord en temps réel | Prend en charge les tableaux de bord en temps réel avec certaines limitations |
| **Connectivité des données** | Se connecte à diverses sources de données | Connectivité étendue des données, forte intégration de Microsoft | Large gamme d'options de connexion de données |
| **Interactivité** | Interactivité limitée dans les tableaux de bord | Tableaux de bord hautement interactifs | Tableaux de bord hautement interactifs |
| **Bibliothèques de visualisation** | Grande collection de visualisations. Prend en charge des bibliothèques comme Matplotlib ou Plotly. | Grande bibliothèque de visuels, visuels personnalisés importables | Options de visualisation étendues, forte en narration de données |
| **Collaboration** | Environnement de carnet de notes collaboratif | Fonctionnalités de collaboration au sein de l'écosystème Microsoft | Fonctionnalités de collaboration, support communautaire fort |
| **Personnalisation** | Limitée par rapport aux outils de BI, personnalisable par le code | Grande personnalisation avec des visuels et des rapports | Grande personnalisation avec un accent sur l'attrait visuel |
| **Géospatial** | La visualisation cartographique est disponible mais limitée (pas de couches, géocodage de base) | Entièrement équipé avec des couches et des cartes ESRI | Entièrement équipé avec des couches et des cartes ESRI |
| **Base d'utilisateurs** | Scientifiques, ingénieurs de données | Analystes de données, utilisateurs commerciaux | Analystes de données, utilisateurs commerciaux |

## Conclusion

En résumé, Databricks, PowerBI et Tableau offrent des capacités uniques de création de tableaux de bord adaptées aux différents besoins des utilisateurs :

* Databricks est idéal pour les scientifiques et les ingénieurs qui se concentrent sur le big data et la collaboration, offrant un traitement en temps réel dans un environnement de codage.
* PowerBI s'adresse aux analystes commerciaux et aux utilisateurs non techniques grâce à son interface intuitive et à la forte intégration de Microsoft, ce qui permet de créer facilement des tableaux de bord hautement interactifs.
* Tableau est utile pour les utilisateurs qui privilégient la visualisation avancée des données et la narration grâce à sa conception conviviale et à son interactivité dynamique.

Le choix de ces outils dépend des compétences techniques de l'utilisateur, des exigences en matière de données et du niveau souhaité d'interactivité et de personnalisation du tableau de bord.
