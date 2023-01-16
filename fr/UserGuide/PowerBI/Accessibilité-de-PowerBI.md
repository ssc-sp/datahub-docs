[_metadata_: remarks]:- "Automatically translated with DeepL. From: /UserGuide/PowerBI/PowerBI-Accessibility.md"

[_(draft documentation, please review)_](/UserGuide/PowerBI/PowerBI-Accessibility.md)

---
onProfileExclude : ssc
---

# Directives d'accessibilité de PowerBI

## Fonctions d'accessibilité intégrées qui ne nécessitent aucune configuration

TBD

## Navigation par clavier

TBD

## Service Power BI
Après avoir ouvert un rapport Power BI, appuyez sur le point d'interrogation ( ?) pour afficher les raccourcis clavier.

Les raccourcis sont :

| **On Report** | | |
|--|--|
| **Command** | **Shortcuts** |
| Déplacer entre les sections d'un rapport | Ctrl + F6 | ...

| **Sur le visuel** | |
|--|--|
| **Command** | **Shortcuts** |
| Déplacez le focus sur le menu visuel | Alt + Shift + F10 | |
| Montrer comme un tableau | Alt + Shift + F11 |
| Entrer un visuel ou une couche | Entrer |
| Sortir d'un calque ou d'un visuel | Echap.
| Sélectionner ou désélectionner un point de données | Espace | ...
| Multi-sélectionner des points de données | Ctrl + Espace | ...
| Montrer les détails du point de données | Ctrl + H | ...
| Effacer la sélection de données | Ctrl + Shift + C | ...

| **Accessibilité du trancheur** | |
|--|--|
| **Command** | **Shortcuts** |
| Contrôle du trancheur | Enter |

| **Rapport incorporé** | | |
|--|--|
| **Command** | **Shortcuts** |
| Focus sur le rapport | Ctrl + Enter | ...

## Power BI Desktop
Voir le lien suivant pour plus d'informations sur la navigation dans Power BI Desktop via les raccourcis clavier :
- [https://docs.microsoft.com/en-us/power-bi/create-reports/desktop-accessibility-keyboard-shortcuts]()

## Compatibilité avec les lecteurs d'écran
En général, tous les objets de Power BI qui permettent une navigation au clavier sont également compatibles avec les lecteurs d'écran. Lorsqu'un utilisateur de rapports navigue vers un visuel, le lecteur d'écran lit le titre, le type de visuel et le texte alt s'il a été défini.

## Vue des couleurs à fort contraste
Power BI prend en charge les contrastes élevés pour les rapports. Si vous utilisez un mode de contraste élevé dans Windows, Power BI Desktop détecte automatiquement le thème de contraste élevé utilisé dans Windows et applique ces paramètres à vos rapports. Ces couleurs à fort contraste suivent le rapport lorsqu'il est publié sur le service Power BI ou ailleurs.
(parler de la façon de changer le contraste élevé dans Power BI Service)

## Mode de mise au point
Si un utilisateur de rapport regarde un visuel dans un tableau de bord, il peut étendre le visuel pour remplir une plus grande partie de son écran en sélectionnant l'icône du mode Focus dans le menu contextuel du visuel.

Les utilisateurs du rapport peuvent consulter les options d'un visuel en le sélectionnant puis en appuyant sur Alt+Shift+F10.

## Afficher le tableau de données
Les utilisateurs du rapport peuvent également afficher les données dans un visuel sous forme de tableau en appuyant sur Alt+Shift+F11. Ce tableau est similaire à l'option Afficher les données du menu contextuel du visuel, mais il affiche un tableau adapté aux lecteurs d'écran.

## Fonctionnalités d'accessibilité intégrées nécessitant une configuration

## Texte alternatif
- Visuel :
  - Statique : Le nombre de nouveaux cas montre à quel point le virus se propage à San Francisco. Appuyez sur les touches Contrôle et Flèche droite pour entrer dans le graphique. Utilisez la touche Entrée pour sélectionner un point de données. Utilisez la touche Echap pour quitter.
  - Dynamique : Le nombre de nouveaux cas montre à quel point le virus se propage à San Francisco. La moyenne la plus récente est de [Mesure des nouveaux cas] nouveaux cas. Appuyez sur les touches Control et Right Arrow pour entrer dans le graphique. Utilisez la touche Entrée pour sélectionner un point de données. Utilisez la touche Echap pour quitter.
- Table :
  - Utilisez les touches Contrôle et Flèche droite pour entrer dans la table. Utilisez les touches fléchées pour vous déplacer dans le tableau. Appuyez sur la touche Entrée pour sélectionner une cellule. Sélectionnez un en-tête de colonne pour trier par cette colonne. Appuyez sur la touche Echap pour quitter.
- Filtre :
  - Slicer filtre les dates affichées sur le graphique linéaire et le tableau. La sélection par défaut est toutes les dates comportant des données. Utilisez les touches Contrôle + flèche droite pour entrer le filtre. Utilisez la barre d'espacement ou la touche Entrée pour sélectionner les éléments. Utilisez la touche Echap pour quitter. Les graphiques sont mis à jour.
- Carte :
  - Carte indiquant le cumul, ou le total courant, des cas de covidie confirmés. Le total courant le plus récent est de [Cas cumulés] cas, au [date max]. Appuyez sur Control + Flèche droite pour entrer dans la carte. Utilisez Echap pour sortir.
Pour les zones de texte, mettez le texte dans la zone de texte alt également.
- Bouton :
  - Sélectionner le bouton radio intitulé "Cumulative totals". Ce bouton est déjà sélectionné, le tableau de bord affiche les totaux cumulés des cas de covidie et des décès par sexe.
  - Bouton radio non sélectionné intitulé "Tendances dans le temps". Appuyez sur la touche Entrée pour sélectionner cette vue et le tableau de bord sera mis à jour pour montrer les tendances dans le temps des cas de covidie par sexe.

- Formule :
  - ** "Type de graphique "** + montrant + "ce qu'il montre". +
  - **Où** "le but de regarder le graphique". +
  - **"Instructions du clavier "**, comme "Appuyez sur Control + flèche droite pour entrer dans le graphique. Appuyez sur entrée pour lire des points de données spécifiques. Utilisez escape pour quitter le visuel."

## Ordre des onglets
La définition de l'ordre des onglets aide les utilisateurs du clavier à naviguer dans votre rapport dans un ordre qui correspond à la façon dont les utilisateurs traitent visuellement les éléments visuels du rapport. Si vous incluez des formes et des images décoratives dans votre rapport, vous devez les supprimer de l'ordre des onglets.

## Titres et étiquettes
Les titres des visuels et des pages du rapport sont des éléments d'accessibilité importants qui orientent le consommateur du rapport. Évitez d'utiliser des acronymes ou du jargon dans les titres de vos rapports ; si vous communiquez le rapport à un nouvel utilisateur ou à une personne extérieure à votre organisation, il se peut qu'elle ne sache pas ce que signifient vos termes ou acronymes. L'image suivante montre un visuel avec un acronyme dans le titre (à gauche), et un titre plus clair pour le visuel à droite.

## Marqueurs
Une bonne pratique consiste à éviter d'utiliser la couleur (y compris les fonctions de mise en forme conditionnelle) comme seul moyen de transmettre des informations. Au lieu de cela, vous pouvez utiliser des marqueurs pour transmettre différentes séries.

Pour les visuels de lignes, de zones et de combinaisons, ainsi que pour les visuels de dispersion et de bulles, vous pouvez activer les marqueurs et utiliser une forme de marqueur différente pour chaque ligne.

## Thèmes du rapport
Certaines combinaisons de couleurs sont particulièrement difficiles à distinguer pour les utilisateurs souffrant de troubles de la vision des couleurs. Il s'agit notamment des combinaisons suivantes :

- vert et rouge
- vert et brun
- bleu et violet
- vert et bleu
- vert clair et jaune
- bleu et gris
- vert et gris
- vert et noir

Évitez d'utiliser ces couleurs ensemble dans un graphique ou sur la même page de rapport. Power BI dispose de quelques thèmes intégrés pour vous aider à rendre votre rapport plus accessible, mais la meilleure pratique consiste à vérifier votre rapport à l'aide de certains des outils supplémentaires suggérés dans cet article.

## Tips

## Comprendre ce que veut votre public

## Gardez votre rapport simple et cohérent

## Test de dépistage de la malvoyance
- réduire la luminosité
- changer les couleurs à fort contraste

## Liste de contrôle de l'accessibilité du rapport

## Tous les visuels

## Trancheurs

## Boîte de texte

## Interactions visuelles

## Ordre de tri

## Info-bulles

## Vidéo

## Audio

## Formes

## Images

## Visuels Power BI

## Across visuals on the page

## Considérations et limitations
Il y a quelques problèmes et limitations connus avec les fonctions d'accessibilité. Les descriptions de ces problèmes et limitations figurent dans la liste suivante :
- Lorsque vous utilisez des lecteurs d'écran avec Power BI Desktop, vous bénéficiez d'une expérience optimale si vous ouvrez votre lecteur d'écran avant d'ouvrir tout fichier dans Power BI Desktop.

## Référence
- [https://docs.microsoft.com/en-us/power-bi/create-reports/desktop-accessibility-creating-reports]()
- [https://datasf.gitbook.io/public-data-visualization-guide/accessibility/alt-text]()

