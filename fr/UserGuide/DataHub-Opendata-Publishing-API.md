[_metadata_: remarks]:- "Automatically translated with DeepL. From: /UserGuide/DataHub-Opendata-Publishing-API.md"

[_(draft documentation, please review)_](/UserGuide/DataHub-Opendata-Publishing-API.md)

_DRAFT SPECS_

DataHub fournit une API permettant d'utiliser ses flux de travail pour publier des données vers des données ouvertes et d'autres services.

## Soumettre l'URL du fichier pour le partager dans OpenData

**Endpoint**

DEV : `https://dh-portal-app-dev.azurewebsites.net/api/opendata/submit`

**En-têtes de requête**

`DH-Auth-Key : <auth_token>`

**Corps de la requête (JSON)**

| Nom du champ | Type | Description
|------------|------|-------------|
| file_url | string (max 200) | URL de l'ensemble de données source qui sera publié dans Open Data. Cette URL doit être accessible au public sans aucune restriction IP.
| file_id | string (max 200) | Cet ID doit être unique, nous suggérons fortement d'utiliser un GUID. Cet ID sera utilisé pour éviter les doubles soumissions de fichiers.
| nom_fichier | chaîne (max 200) | Nom du fichier utilisé pour afficher dans l'interface utilisateur du flux de travail de partage.
| email_contact | string | Contact e-mail responsable du flux de travail de partage.
| La collection (spécifique au domaine) à laquelle appartient l'enregistrement de métadonnées. Choix : **primaire, code, api, app**
| title_translated_en | string | Le nom anglais par lequel l'ensemble de données est connu.
| title_translated_fr | string | Le nom français sous lequel l'ensemble de données est connu.
| notes_translated_en | string | Une description de l'ensemble de données, en anglais. Une description peut inclure, sans s'y limiter : un résumé, une table des matières ou un compte rendu en texte libre de la ressource.
| notes_translated_fr | string | Un compte rendu de l'ensemble de données, en français. Une description peut inclure, sans s'y limiter : un résumé, une table des matières ou un compte rendu en texte libre de la ressource.
| keywords_en | string | Mots ou phrases couramment utilisés pour décrire l'ensemble de données, en anglais. (Séparez les entrées multiples par des virgules)
| keywords_fr | string | Mots ou phrases couramment utilisés pour décrire l'ensemble de données, en français. (Séparez les entrées multiples par des virgules)
| sujet | multi-choice | arts_music_literature, agriculture, économie_et_industrie, éducation_et_formation, formulaire_descripteurs, gouvernement_et_politique, santé_et_sécurité, histoire_et_archéologie, information_et_communications, travail, langue_et_linguistique, droit, militaire, nature_et_environnement, personnes, processus, société_et_culture, science_et_technologie, transport
| fréquence | choix | selon les besoins, continuel, P1D, P0.33W, P0.5W, P1W, P2W, P0.5M, P1M, P2M, P3M, P4M, P6M, P1Y, P2Y, P3Y, P4Y, irrégulier, non_planifié, inconnu
| date_published | date | Date à laquelle l'ensemble de données sera publié, ne doit pas être dans le futur.
| juridiction | choix | fédéral, provincial, municipal, utilisateur
| Date de début de la période couverte par l'ensemble de données (AAAA-MM-JJ).
| Date de fin de la période couverte par l'ensemble de données (AAAA-MM-JJ).
| audience | multi-choice | aboriginal_peoples, business, children, educators, employers, funding_applicants, general_public, government, immigrants, job_seekers, media, noncanadians, nongovernmental_organisations, parents, persons_with_disabilities, rural_community, seniors, scientists, students, travellers, veterans, visitors_to_canada, women, youth
| digital_object_identifier | string | L'identifiant d'objet numérique attribué à l'ensemble de données.

** Exemple

```
{ 'file_url' : 'https://s3.asdasd.sdfsdf.com/mydata.csv', 'file_id' : '234452135', 'file_name' : 'MyData.csv', 'title_translated_en' : 'the data', ... }
```

**Réponse sortie**

`200`

Succès, message JSON contenant :
| Nom du champ | Type | Description
|------------|------|-------------|
| datahub_id | string | L'identifiant (GUID) de l'ensemble de données dans DataHub.
| flow_url | string | l'URL du flux de publication que l'utilisateur doit utiliser pour poursuivre le processus de publication.

`400`

Mauvaise demande, liée à des champs obligatoires manquants, des choix invalides ou des tentatives de partage en double.

`401`

Non autorisé si le jeton est manquant, expiré ou falsifié.

## Récupérer la localisation du choix des métadonnées

**Endpoint**

DEV : `https://dh-portal-app-dev.azurewebsites.net/api/opendata/choices`

**En-têtes de requête**

`Authorization : <auth_token>`

**Réponse**

`200`

Document JSON

```json
[
    {
        "champ" : "collection",
        "choix" : [
            {
                "valeur" : "primaire",
                "en" : "Non-Spatial",
                "fr" : "Non spatiales"
            },
            {
                "valeur" : "code",
                "en" : "Open code",
                "fr" : "Code ouvert"
            },
            {
                "valeur" : "api",
                "en" : "API",
                "fr" : "API"
            },
            {
                "valeur" : "app",
                "en" : "Application",
                "fr" : "Application"
            }
        ]
    },
    {
        "champ" : "sujet",
        "choix" : [
            {
                "valeur" : "arts_music_literature",
                "en" : "Arts, musique, littérature",
                "fr" : "Arts, musique, littérature"
            },
            {
                "valeur" : "agriculture",
                "en" : "Agriculture",
                "fr" : "Agriculture"
            },
            {
                "valeur" : "économie_et_industrie",
                "en" : "Économie et industrie",
                "fr" : "Économie et industrie"
            },
            {
                "valeur" : "éducation_et_formation",
                "en" : "Éducation et formation",
                "fr" : "Éducation et formation"
            },
            {
                "valeur" : "form_descriptors",
                "en" : "Form Descriptors",
                "fr" : "Format"
            },
            {
                "valeur" : "gouvernement_et_politique",
                "en" : "Gouvernement et politique",
                "fr" : "Gouvernement et vie politique"
            },
            {
                "valeur" : "santé_et_sécurité",
                "en" : "Santé et sécurité",
                "fr" : "Santé et sécurité"
            },
            {
                "valeur" : "histoire_et_archéologie",
                "en" : "Histoire et Archéologie",
                "fr" : "Histoire et archéologie"
            },
            {
                "valeur" : "information_et_communications",
                "en" : "Information et communications",
                "fr" : "Information et communication"
            },
            {
                "valeur" : "travail",
                "en" : "Labour",
                "fr" : "Travail et emploi"
            },
            {
                "valeur" : "langue_et_linguistique",
                "en" : "Langue et Linguistique",
                "fr" : "Langue et linguistique"
            },
            {
                "valeur" : "loi",
                "en" : "Droit",
                "fr" : "Droit"
            },
            {
                "valeur" : "militaire",
                "en" : "Military",
                "fr" : "Histoire et science militaire"
            },
            {
                "valeur" : "nature_et_environnement",
                "en" : "Nature et environnement",
                "fr" : "Nature et environnement"
            },
            {
                "valeur" : "personnes",
                "en" : "Personnes",
                "fr" : "Personnes"
            },
            {
                "valeur" : "processus",
                "en" : "Processes",
                "fr" : "Liens et fonctions"
            },
            {
                "valeur" : "société_et_culture",
                "en" : "Société et culture",
                "fr" : "Société et culture"
            },
            {
                "valeur" : "science_et_technologie",
                "en" : "Science et technologie",
                "fr" : "Sciences et technologie"
            },
            {
                "valeur" : "transport",
                "en" : "Transport",
                "fr" : "Transport"
            }
        ]
    },
    {
        "champ" : "fréquence",
        "choix" : [
            {
                "valeur" : "as_need",
                "en" : "As Needed",
                "fr" : "Au besoin"
            },
            {
                "valeur" : "continuel",
                "en" : "Continu",
                "fr" : "Continuer"
            },
            {
                "valeur" : "P1D",
                "en" : "Daily",
                "fr" : "Quotidien"
            },
            {
                "valeur" : "P0.33W",
                "en" : "Trois fois par semaine",
                "fr" : "Trois fois par semaine"
            },
            {
                "valeur" : "P0.5W",
                "en" : "Deux fois par semaine",
                "fr" : "Deux fois par semaine"
            },
            {
                "valeur" : "P1W",
                "en" : "Hebdomadaire",
                "fr" : "Hebdomadaire"
            },
            {
                "valeur" : "P2W",
                "en" : "Every two weeks",
                "fr" : "Quinzomadaire"
            },
            {
                "valeur" : "P0.5M",
                "en" : "Deux fois par mois",
                "fr" : "Bimensuel"
            },
            {
                "valeur" : "P1M",
                "en" : "Mensuel",
                "fr" : "Mensuel"
            },
            {
                "valeur" : "P2M",
                "en" : "Every two months",
                "fr" : "Bimestriel"
            },
            {
                "valeur" : "P3M",
                "en" : "trimestrielle",
                "fr" : "Trimestriel"
            },
            {
                "valeur" : "P4M",
                "en" : "Tous les quatre mois",
                "fr" : "Trois fois par année"
            },
            {
                "valeur" : "P6M",
                "en" : "Biannually",
                "fr" : "Semestriel"
            },
            {
                "valeur" : "P1Y",
                "en" : "Annuellement",
                "fr" : "Annuel"
            },
            {
                "valeur" : "P2Y",
                "en" : "Tous les deux ans",
                "fr" : "Biennal"
            },
            {
                "valeur" : "P3Y",
                "en" : "Tous les trois ans",
                "fr" : "Triennal"
            },
            {
                "valeur" : "P4Y",
                "en" : "Tous les cinq ans",
                "fr" : "Quinquennal"
            },
            {
                "valeur" : "irrégulier",
                "en" : "Irrégulier",
                "fr" : "Irrégulier"
            },
            {
                "valeur" : "not_planned",
                "en" : "Non prévu",
                "fr" : "Non planifié"
            },
            {
                "valeur" : "inconnu",
                "en" : "Inconnu",
                "fr" : "Inconnu"
            }
        ]
    },
    {
        "champ" : "juridiction",
        "choix" : [
            {
                "valeur" : "fédéral",
                "en" : "Fédéral",
                "fr" : "Fédérale"
            },
            {
                "valeur" : "provincial",
                "en" : "Provincial",
                "fr" : "Provinciale"
            },
            {
                "valeur" : "municipal",
                "en" : "Municipal",
                "fr" : "Municipal"
            },
            {
                "valeur" : "utilisateur",
                "en" : "Utilisateur",
                "fr" : "Utilisateur"
            }
        ]
    },
    {
        "champ" : "audience",
        "choix" : [
            {
                "valeur" : "peuples_aborigènes",
                "en" : "Peuples autochtones",
                "fr" : "Peuples autochtones"
            },
            {
                "valeur" : "entreprise",
                "en" : "Business",
                "fr" : "Entreprises"
            },
            {
                "valeur" : "enfants",
                "en" : "Children",
                "fr" : "Enfants"
            },
            {
                "valeur" : "éducateurs",
                "en" : "Educateurs",
                "fr" : "Éducateurs"
            },
            {
                "valeur" : "employeurs",
                "en" : "Employeurs",
                "fr" : "Employeurs"
            },
            {
                "Valeur" : "funding_applicants",
                "en" : "Candidats au financement",
                "fr" : "Demandeurs de financement"
            },
            {
                "valeur" : "général_public",
                "en" : "Grand public",
                "fr" : "Grand public"
            },
            {
                "valeur" : "gouvernement",
                "en" : "Gouvernement",
                "fr" : "Gouvernement"
            },
            {
                "valeur" : "immigrants",
                "en" : "Immigrants",
                "fr" : "Immigrants"
            },
            {
                "valeur" : "job_seekers",
                "en" : "Chercheurs d'emploi",
                "fr" : "Chercheurs d'emploi"
            },
            {
                "valeur" : "média",
                "en" : "Media",
                "fr" : "Médias"
            },
            {
                "valeur" : "noncanadiens",
                "en" : "Non-Canadiens",
                "fr" : "Non-Canadiens"
            },
            {
                "valeur" : "organisations_non_gouvernementales",
                "en" : "Organisations non gouvernementales",
                "fr" : "Organisations non-gouvernementales"
            },
            {
                "valeur" : "parents",
                "en" : "Parents",
                "fr" : "Parents"
            },
            {
                "valeur" : "personnes_avec_incapacités",
                "en" : "Personnes handicapées",
                "fr" : "Personnes handicapées"
            },
            {
                "valeur" : "rural_community",
                "en" : "Communauté rurale",
                "fr" : "Communauté rurale"
            },
            {
                "valeur" : "seniors",
                "en" : "Seniors",
                "fr" : "Aînés"
            },
            {
                "valeur" : "scientifiques",
                "en" : "Scientifiques",
                "fr" : "Scientifiques"
            },
            {
                "valeur" : "étudiants",
                "en" : "Students",
                "fr" : "Étudiants"
            },
            {
                "valeur" : "voyageurs",
                "en" : "Voyageurs",
                "fr" : "Voyageurs"
            },
            {
                "valeur" : "vétérans",
                "en" : "Vétérans",
                "fr" : "Anciens combattants"
            },
            {
                "valeur" : "visiteurs_to_canada",
                "fr" : "Visiteurs au Canada",
                "fr" : "Visiteurs au Canada"
            },
            {
                "valeur" : "femmes",
                "en" : "Femmes",
                "fr" : "Femmes"
            },
            {
                "valeur" : "jeune",
                "en" : "Youth",
                "fr" : "Jeunesse"
            }
        ]
    }
]
```

`401`

Non autorisé si le jeton est manquant, expiré ou falsifié.


