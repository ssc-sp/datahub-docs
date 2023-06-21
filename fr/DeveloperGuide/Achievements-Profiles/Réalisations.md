---
remarks: Translation reviewed by DataHub team
source: /DeveloperGuide/Achievements-Profiles/Achievements.md
draft: true
---

# Réalisations

## Modèle JSON

Le diagramme suivant montre un exemple de modèle JSON pour la fonctionnalité Réalisations de l'utilisateur :

```json
{
  "Id" : "EXP-000",
  "Nom" : "Jusqu'à l'infini et au-delà",
  "Description" : "Déverrouiller tous les succès d'exploration de la version initiale",
  "Points" : 1,
  "AchievementType" : "Trophy|Achievement",
  "RuleExpressions" : [
    "Utils.AchievementPassed(\"EXP-001\", input1)",
    "Utils.AchievementPassed(\"EXP-002\", input1)",
    "...",
    "Utils.AchievementPassed(\N-"EXP-011", input1)"
  ]
}
```

## `DHA` Datahub Achievements

| Le type d'accomplissement est le même que celui de l'entreprise, à savoir : l'identité, le nom, la description, les conditions et le type d'accomplissement.
| --------- | ------------------------- | ------------------------------- | ------------------------------- | --------------- |
| `DHA-001` | Connaisseur de la collaboration | Connecté à DataHub | Connecté au moins une fois | Réussite |
| DHA-002` | Collaboration Commander | Inviter un utilisateur à votre espace de travail | Inviter un utilisateur à votre espace de travail | Réalisation |
| DHA-003` | Espace de travail Warrior | Rejoindre un espace de travail | Rejoindre un espace de travail | Réussite |
| DHA-004` | Espace de travail Wanderlust | Laisser un espace de travail | Laisser un espace de travail | Réussite |
| DHA-005` | Contributeur régulier | Se connecter plusieurs fois par jour | Se connecter au moins deux fois par jour | Réussite |

## `STR` Réalisations de Storage Explorer

| Le type d'accomplissement est le même que celui de l'entreprise, à savoir : l'identité, le nom, la description, les conditions et le type d'accomplissement.
| --------- | -------------------- | ---------------------------------------------------------- | --------------- | --------------- |
| Storage Savant | Débloquer tous les succès de l'Explorateur de stockage 2.0 | Débloquer tous les FIL | Trophée |
| `STR-001` | Unstoppable Uploader | Télécharger un fichier à l'aide de l'espace de travail Explorateur de stockage | Télécharger un fichier | Réalisation |
| `STR-002` | Storage Socialite | Partager un fichier en utilisant l'espace de travail Explorateur de stockage | Partager un fichier | Réalisation |
| `STR-003` | File Fetcher | Télécharger un fichier à partir de l'espace de travail Explorateur de stockage | Télécharger un fichier | Réalisation |
| `STR-004` | Daredevil Deleter | Supprimer un fichier de l'espace de travail avec l'explorateur de stockage | Supprimer un fichier | Réalisation |
| `STR-005` | Dossier Fashionista | Créer un dossier dans l'explorateur de stockage de l'espace de travail | Créer un dossier | Réalisation |
| `STR-006` | Dossier Adieu | Supprimer un dossier dans l'explorateur de stockage de l'espace de travail | Supprimer un dossier | Réalisation |

## `EXP` Réalisations en matière d'exploration

| Le type d'accomplissement est le même que celui de l'entreprise, à savoir : l'identité, le nom, la description, les conditions et le type d'accomplissement.
| --------- | ----------------------- | ---------------------------------------------------- | ---------------------- | --------------- |
| Explorer Extraordinaire | Débloquer tous les succès de l'Exploration 2.0 | Débloquer toutes les EXP | Trophées
| Storage Safari | Naviguer vers la page Storage Explorer d'un espace de travail | Visiter Storage Explorer | Achievement |
| `EXP-002` | Databricks Discovery | Naviguer vers la page Databricks d'un espace de travail | Visiter Databricks | Achievement |
| Ressources | Voir la section des ressources de DataHub | Visiter Ressources | Réalisation |
| Espace de travail Wanderer | Voir un espace de travail dont vous n'êtes pas membre | Visiter un autre projet | Réalisation |
| Espace de travail Wayfarer | Visiter l'un de vos propres espaces de travail | Visiter votre propre projet | Réalisations
| `EXP-006` | Légende des liens | Utiliser un lien récent pour revenir à la même page | Utiliser un lien récent | Réalisation |
| `EXP-007` | Polyglotte prolifique | Passer d'une langue à l'autre dans le portail | Changer de culture | Réalisation |
| Profil de l'utilisateur | Voir votre propre page de profil | Visiter un profil | Réussite |
| Profil de l'utilisateur | Voir le profil d'une autre personne | Visiter un autre profil | Réussite |
