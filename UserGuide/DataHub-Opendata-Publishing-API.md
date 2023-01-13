_DRAFT SPECS_

DataHub provides API to use its workflows for publishing data to open data and other services.

## Submit File URL to share in OpenData

**Endpoint** 

DEV: `https://dh-portal-app-dev.azurewebsites.net/api/opendata/submit`

**Request headers**

`DH-Auth-Key: <auth_token>`

**Request Body (JSON)**

| Field Name | Type | Description |
|------------|------|-------------|
| file_url    | string (max 200) | URL of the source data set that will be published to Open Data. This URL is expected to be publicly accessible without any IP restrictions
| file_id  | string (max 200) | This ID needs to be unique, we strongly suggest to use a GUID. This ID will be used to prevent double submissions of files.
| file_name | string (max 200) | File name used to display in the sharing workflow UI. 
| email_contact | string | Email contact responsible for the sharing workflow.
| collection | choice | The collection (domain specific) to which the metadata record belongs. Choices: **primary, code, api, app**
| title_translated_en | string | The English name by which the dataset is known.
| title_translated_fr | string | The French name by which the dataset is known.
| notes_translated_en | string | An account of the dataset, in English. A description may include but is not limited to: an abstract, a table of contents, or a free-text account of the resource.
| notes_translated_fr | string | An account of the dataset, in French. A description may include but is not limited to: an abstract, a table of contents, or a free-text account of the resource.
| keywords_en | string | Commonly used words or phrases which describe the dataset, in English. (Separate multiple entries by commas)
| keywords_fr | string | Commonly used words or phrases which describe the dataset, in French. (Separate multiple entries by commas)
| subject | multi-choice | arts_music_literature, agriculture, economics_and_industry, education_and_training, form_descriptors, government_and_politics, health_and_safety, history_and_archaeology, information_and_communications, labour, language_and_linguistics, law, military, nature_and_environment, persons, processes, society_and_culture, science_and_technology, transport
| frequency | choice | as_needed, continual, P1D, P0.33W, P0.5W, P1W, P2W, P0.5M, P1M, P2M, P3M, P4M, P6M, P1Y, P2Y, P3Y, P4Y, irregular, not_planned, unknown
| date_published | date | Date the dataset will be published, must not be in the future.
| jurisdiction | choice | federal, provincial, municipal, user
| time_period_coverage_start | date | The start date of the period covered by the dataset (YYYY-MM-DD)
| time_period_coverage_end | date | The end date of the period covered by the dataset (YYYY-MM-DD)
| audience | multi-choice | aboriginal_peoples, business, children, educators, employers, funding_applicants, general_public, government, immigrants, job_seekers, media, noncanadians, nongovernmental_organizations, parents, persons_with_disabilities, rural_community, seniors, scientists, students, travellers, veterans, visitors_to_canada, women, youth 
| digital_object_identifier | string | The Digital Object Identifier assigned to the dataset. 

** Example 

```
{ 'file_url': 'https://s3.asdasd.sdfsdf.com/mydata.csv', 'file_id':'234452135', 'file_name': 'MyData.csv', 'title_translated_en': 'the data', ... }
```

**Response Output**

`200`

Success, JSON message containing: 
| Field Name | Type | Description |
|------------|------|-------------|
| datahub_id | string | The identifier (GUID) of the dataset in DataHub.
| flow_url   | string | the URL of the publication flow that the user needs to use to continue the publication process.

`400`

Bad request, related to missing required fields, invalid choices or duplicated share attempts. 

`401`

Unauthorized if token missing, expired or forged.

## Retrieve Metadata Choice localization

**Endpoint** 

DEV: `https://dh-portal-app-dev.azurewebsites.net/api/opendata/choices`

**Request headers**

`Authorization: <auth_token>`

**Response**

`200`

JSON document 

```json 
[
    {
        "field": "collection",
        "choices": [
            {
                "value": "primary",
                "en": "Non-Spatial",
                "fr": "Non spatiales"
            },
            {
                "value": "code",
                "en": "Open code",
                "fr": "Code ouvert"
            },
            {
                "value": "api",
                "en": "API",
                "fr": "API"
            },
            {
                "value": "app",
                "en": "Application",
                "fr": "Application"
            }
        ]
    },
    {
        "field": "subject",
        "choices": [
            {
                "value": "arts_music_literature",
                "en": "Arts, Music, Literature",
                "fr": "Arts, musique, littérature"
            },
            {
                "value": "agriculture",
                "en": "Agriculture",
                "fr": "Agriculture"
            },
            {
                "value": "economics_and_industry",
                "en": "Economics and Industry",
                "fr": "Économie et industrie"
            },
            {
                "value": "education_and_training",
                "en": "Education and Training",
                "fr": "Éducation et formation"
            },
            {
                "value": "form_descriptors",
                "en": "Form Descriptors",
                "fr": "Format"
            },
            {
                "value": "government_and_politics",
                "en": "Government and Politics",
                "fr": "Gouvernement et vie politique"
            },
            {
                "value": "health_and_safety",
                "en": "Health and Safety",
                "fr": "Santé et sécurité"
            },
            {
                "value": "history_and_archaeology",
                "en": "History and Archaeology",
                "fr": "Histoire et archéologie"
            },
            {
                "value": "information_and_communications",
                "en": "Information and Communications",
                "fr": "Information et communication"
            },
            {
                "value": "labour",
                "en": "Labour",
                "fr": "Travail et emploi"
            },
            {
                "value": "language_and_linguistics",
                "en": "Language and Linguistics",
                "fr": "Langue et linguistique"
            },
            {
                "value": "law",
                "en": "Law",
                "fr": "Droit"
            },
            {
                "value": "military",
                "en": "Military",
                "fr": "Histoire et science militaire"
            },
            {
                "value": "nature_and_environment",
                "en": "Nature and Environment",
                "fr": "Nature et environnement"
            },
            {
                "value": "persons",
                "en": "Persons",
                "fr": "Personnes"
            },
            {
                "value": "processes",
                "en": "Processes",
                "fr": "Liens et fonctions"
            },
            {
                "value": "society_and_culture",
                "en": "Society and Culture",
                "fr": "Société et culture"
            },
            {
                "value": "science_and_technology",
                "en": "Science and Technology",
                "fr": "Sciences et technologie"
            },
            {
                "value": "transport",
                "en": "Transport",
                "fr": "Transport"
            }
        ]
    },
    {
        "field": "frequency",
        "choices": [
            {
                "value": "as_needed",
                "en": "As Needed",
                "fr": "Au besoin"
            },
            {
                "value": "continual",
                "en": "Continual",
                "fr": "Continue"
            },
            {
                "value": "P1D",
                "en": "Daily",
                "fr": "Quotidien"
            },
            {
                "value": "P0.33W",
                "en": "Three times per week",
                "fr": "Trois fois par semaine"
            },
            {
                "value": "P0.5W",
                "en": "Two times per week",
                "fr": "Deux fois par semaine"
            },
            {
                "value": "P1W",
                "en": "Weekly",
                "fr": "Hebdomadaire"
            },
            {
                "value": "P2W",
                "en": "Every two weeks",
                "fr": "Quinzomadaire"
            },
            {
                "value": "P0.5M",
                "en": "Twice monthly",
                "fr": "Bimensuel"
            },
            {
                "value": "P1M",
                "en": "Monthly",
                "fr": "Mensuel"
            },
            {
                "value": "P2M",
                "en": "Every two months",
                "fr": "Bimestriel"
            },
            {
                "value": "P3M",
                "en": "Quarterly",
                "fr": "Trimestriel"
            },
            {
                "value": "P4M",
                "en": "Every four months",
                "fr": "Trois fois par année"
            },
            {
                "value": "P6M",
                "en": "Biannually",
                "fr": "Semestriel"
            },
            {
                "value": "P1Y",
                "en": "Annually",
                "fr": "Annuel"
            },
            {
                "value": "P2Y",
                "en": "Every two years",
                "fr": "Biennal"
            },
            {
                "value": "P3Y",
                "en": "Every three years",
                "fr": "Triennal"
            },
            {
                "value": "P4Y",
                "en": "Every five years",
                "fr": "Quinquennal"
            },
            {
                "value": "irregular",
                "en": "Irregular",
                "fr": "Irrégulier"
            },
            {
                "value": "not_planned",
                "en": "Not Planned",
                "fr": "Non planifié"
            },
            {
                "value": "unknown",
                "en": "Unknown",
                "fr": "Inconnu"
            }
        ]
    },
    {
        "field": "jurisdiction",
        "choices": [
            {
                "value": "federal",
                "en": "Federal",
                "fr": "Fédérale"
            },
            {
                "value": "provincial",
                "en": "Provincial",
                "fr": "Provinciale"
            },
            {
                "value": "municipal",
                "en": "Municipal",
                "fr": "Municipal"
            },
            {
                "value": "user",
                "en": "User",
                "fr": "Utilisateur"
            }
        ]
    },
    {
        "field": "audience",
        "choices": [
            {
                "value": "aboriginal_peoples",
                "en": "Aboriginal peoples",
                "fr": "Peuples autochtones"
            },
            {
                "value": "business",
                "en": "Business",
                "fr": "Entreprises"
            },
            {
                "value": "children",
                "en": "Children",
                "fr": "Enfants"
            },
            {
                "value": "educators",
                "en": "Educators",
                "fr": "Éducateurs"
            },
            {
                "value": "employers",
                "en": "Employers",
                "fr": "Employeurs"
            },
            {
                "value": "funding_applicants",
                "en": "Funding applicants",
                "fr": "Demandeurs de financement"
            },
            {
                "value": "general_public",
                "en": "General public",
                "fr": "Grand public"
            },
            {
                "value": "government",
                "en": "Government",
                "fr": "Gouvernement"
            },
            {
                "value": "immigrants",
                "en": "Immigrants",
                "fr": "Immigrants"
            },
            {
                "value": "job_seekers",
                "en": "Job seekers",
                "fr": "Chercheurs d’emploi"
            },
            {
                "value": "media",
                "en": "Media",
                "fr": "Médias"
            },
            {
                "value": "noncanadians",
                "en": "Non-Canadians",
                "fr": "Non-Canadiens"
            },
            {
                "value": "nongovernmental_organizations",
                "en": "Non-governmental organizations",
                "fr": "Organisations non governementales"
            },
            {
                "value": "parents",
                "en": "Parents",
                "fr": "Parents"
            },
            {
                "value": "persons_with_disabilities",
                "en": "Persons with disabilities",
                "fr": "Personnes handicapées"
            },
            {
                "value": "rural_community",
                "en": "Rural community",
                "fr": "Communauté rurale"
            },
            {
                "value": "seniors",
                "en": "Seniors",
                "fr": "Aînés"
            },
            {
                "value": "scientists",
                "en": "Scientists",
                "fr": "Scientifiques"
            },
            {
                "value": "students",
                "en": "Students",
                "fr": "Étudiants"
            },
            {
                "value": "travellers",
                "en": "Travellers",
                "fr": "Voyageurs"
            },
            {
                "value": "veterans",
                "en": "Veterans",
                "fr": "Anciens combattants"
            },
            {
                "value": "visitors_to_canada",
                "en": "Visitors to Canada",
                "fr": "Visiteurs au Canada"
            },
            {
                "value": "women",
                "en": "Women",
                "fr": "Femmes"
            },
            {
                "value": "youth",
                "en": "Youth",
                "fr": "Jeunesse"
            }
        ]
    }
]
```

`401`

Unauthorized if token missing, expired or forged.

 