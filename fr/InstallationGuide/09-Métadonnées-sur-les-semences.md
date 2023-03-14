---
remarks: Automatically translated with DeepL
source: /InstallationGuide/09-Seed-Metadata.md
draft: true
---

## Alimenter les métadonnées

### Option 1

**Sur l'environnement de développement**
- Allez sur la page **Admin**.
- Trouvez la carte **Gestion des métadonnées** et cliquez sur **Ouvrir la page**.
- Sur la page Métadonnées, naviguez jusqu'au bas de la page.
- Cliquez sur **Télécharger** et enregistrez le JSON dans un fichier.

**Sur l'environnement de l'ensemencement**
- Ouvrez la page **Admin**.
- Trouvez la carte **Gestion des métadonnées** et cliquez sur **Ouvrir la page**.
- Sur la page Métadonnées, naviguez jusqu'au bas de la page.
- Cliquez sur **Upload** et sélectionnez le fichier que vous venez de télécharger.

### Option 2
- Copiez le code ci-dessous et enregistrez-le dans un fichier JSON.
- Dans la nouvelle application Web, allez à la page **Admin**.
- Trouvez la carte **Gestion des métadonnées** et cliquez sur **Ouvrir la page**.
- Sur la page Métadonnées, naviguez jusqu'au bas de la page
- Cliquez sur **Upload** et sélectionnez le fichier contenant le JSON ci-dessous.

```
{
  "Profils" : [
    {
      "Nom" : "projet",
      "Sections" : [
        {
          "Name_English_TXT" : "Général",
          "Name_French_TXT" : "Général",
          "Champs" : [
            {
              "FieldDefinitionId" : 1,
              "Required_FLAG" : vrai
            },
            {
              "FieldDefinitionId" : 2,
              "Required_FLAG" : vrai
            },
            {
              "FieldDefinitionId" : 4,
              "Required_FLAG" : vrai
            },
            {
              "FieldDefinitionId" : 5,
              "Required_FLAG" : vrai
            },
            {
              "FieldDefinitionId" : 6,
              "Required_FLAG" : vrai
            },
            {
              "FieldDefinitionId" : 7,
              "Required_FLAG" : vrai
            },
            {
              "FieldDefinitionId" : 8,
              "Required_FLAG" : vrai
            },
            {
              "FieldDefinitionId" : 9,
              "Required_FLAG" : vrai
            },
            {
              "FieldDefinitionId" : 10,
              "Required_FLAG" : vrai
            },
            {
              "FieldDefinitionId" : 11,
              "Required_FLAG" : vrai
            },
            {
              "FieldDefinitionId" : 12,
              "Required_FLAG" : vrai
            },
            {
              "FieldDefinitionId" : 13,
              "Required_FLAG" : vrai
            }
          ]
        }
      ]
    }
  ],
  "Définitions" : [
    {
      "FieldDefinitionId" : 1,
      "Field_Name_TXT" : "nom_fr",
      "Sort_Order_NUM" : 100,
      "Name_English_TXT" : "Nom de l'espace de travail (anglais)",
      "Name_French_TXT" : "Nom de l\u2019espace de travail (Anglais)",
      "English_DESC" : "",
      "French_DESC" : "",
      "Required_FLAG" : vrai,
      "MultiSelect_FLAG" : faux,
      "Validators_TXT" : null,
      "Custom_Field_FLAG" : faux,
      "Default_Value_TXT" : null,
      "CascadeParentId" : null,
      "Choix" : []
    },
    {
      "FieldDefinitionId" : 2,
      "Field_Name_TXT" : "name_fr",
      "Sort_Order_NUM" : 110,
      "Name_English_TXT" : "Nom de l'espace de travail (français)",
      "Name_French_TXT" : "Nom de l\u2019espace de travail (Fran\u00E7ais)",
      "English_DESC" : "",
      "French_DESC" : "",
      "Required_FLAG" : vrai,
      "MultiSelect_FLAG" : faux,
      "Validators_TXT" : null,
      "Custom_Field_FLAG" : faux,
      "Default_Value_TXT" : null,
      "CascadeParentId" : null,
      "Choix" : []
    },
    {
      "FieldDefinitionId" : 3,
      "Field_Name_TXT" : "acronyme",
      "Sort_Order_NUM" : 120,
      "Name_English_TXT" : "Acronyme de l'espace de travail",
      "Name_French_TXT" : "Acronyme de l\u2019espace de travail",
      "English_DESC" : "",
      "French_DESC" : "",
      "Required_FLAG" : vrai,
      "MultiSelect_FLAG" : faux,
      "Validators_TXT" : null,
      "Custom_Field_FLAG" : faux,
      "Default_Value_TXT" : null,
      "CascadeParentId" : null,
      "Choix" : []
    },
    {
      "FieldDefinitionId" : 4,
      "Field_Name_TXT" : "description_fr",
      "Sort_Order_NUM" : 130,
      "Name_English_TXT" : "Description de l'espace de travail (anglais)",
      "Name_French_TXT" : "Description de l\u2019espace de travail (Anglais)",
      "English_DESC" : "",
      "French_DESC" : "",
      "Required_FLAG" : vrai,
      "MultiSelect_FLAG" : faux,
      "Validators_TXT" : null,
      "Custom_Field_FLAG" : faux,
      "Default_Value_TXT" : null,
      "CascadeParentId" : null,
      "Choix" : []
    },
    {
      "FieldDefinitionId" : 5,
      "Field_Name_TXT" : "description_fr",
      "Sort_Order_NUM" : 140,
      "Name_English_TXT" : "Description de l'espace de travail (français)",
      "Name_French_TXT" : "Description de l\u2019espace de travail (Fran\u00E7ais)",
      "English_DESC" : "",
      "French_DESC" : "",
      "Required_FLAG" : vrai,
      "MultiSelect_FLAG" : faux,
      "Validators_TXT" : null,
      "Custom_Field_FLAG" : faux,
      "Default_Value_TXT" : null,
      "CascadeParentId" : null,
      "Choix" : []
    },
    {
      "FieldDefinitionId" : 6,
      "Field_Name_TXT" : "organization_name",
      "Sort_Order_NUM" : 150,
      "Name_English_TXT" : "Nom de l'organisation",
      " Name_French_TXT " : "Nom de l\u2019organisation",
      "English_DESC" : "",
      "French_DESC" : "",
      "Required_FLAG" : vrai,
      "MultiSelect_FLAG" : faux,
      "Validators_TXT" : null,
      "Custom_Field_FLAG" : faux,
      "Default_Value_TXT" : null,
      "CascadeParentId" : null,
      "Choix" : [
        {
          "Value_TXT" : "org-1",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Gouvernement du Canada",
          "Label_French_TXT" : "Gouvernement du Canada"
        },
        {
          "Value_TXT" : "org-2",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Secrétariat du Conseil du Trésor",
          "Label_French_TXT" : "Secr\u00E9tariat du Conseil du Tr\u00E9sor"
        },
        {
          "Value_TXT" : "org-3",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Département pour les femmes et l'égalité des genres",
          "Label_French_TXT" : "Ministu\u00E8re des Femmes et de l\u0027\u00C9galit\u00E9 des genres"
        },
        {
          "Value_TXT" : "org-4",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Ministère de l'Agriculture et de l'Agroalimentaire",
          "Label_French_TXT" : "Ministu\u00E8re de l\u0027Agriculture et de l\u0027Agroalimentaire"
        },
        {
          "Value_TXT" : "org-5",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Ministère du Patrimoine canadien",
          "Label_French_TXT" : "Ministu\u00E8re du Patrimoine canadien"
        },
        {
          "Value_TXT" : "org-6",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Ministère de la Citoyenneté et de l'Immigration",
          "Label_French_TXT" : "Ministu\u00E8re de la Citoyennet\u00E9 et de l\u0027Immigration"
        },
        {
          "Value_TXT" : "org-7",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Department of Crown-Indigenous Relations and Northern Affairs",
          "Label_French_TXT" : "Ministu\u00E8re des Relations Couronne-Autochtones et des Affaires du Nord"
        },
        {
          "Value_TXT" : "org-8",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Département de l'emploi et du développement social",
          "Label_French_TXT" : "Ministu\u00E8re de l\u0027Emploi et du D\u00E9veloppement social"
        },
        {
          "Value_TXT" : "org-9",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Ministère des Finances",
          "Label_French_TXT" : "Ministu\u00E8re des Finances"
        },
        {
          "Value_TXT" : "org-10",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Department of Fisheries and Oceans",
          "Label_French_TXT" : "Ministu\u00E8re des P\u00EAches et des Oc\u00E9ans"
        },
        {
          "Value_TXT" : "org-11",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Département des affaires étrangères, du commerce et du développement",
          "Label_French_TXT" : "Ministu\u00E8re des Affaires \u00E9trang\u00E8res, du Commerce et du D\u00E9veloppement"
        },
        {
          "Value_TXT" : "org-12",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Department of Health",
          "Label_French_TXT" : "Ministu\u00E8re de la Santu\u00E9"
        },
        {
          "Value_TXT" : "org-13",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Department of Indigenous Services",
          "Label_French_TXT" : "Ministu\u00E8re des Services aux Autochtones"
        },
        {
          "Value_TXT" : "org-14",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Département de l'industrie",
          "Label_French_TXT" : "Ministu00E8re de l\u0027Industrie"
        },
        {
          "Value_TXT" : "org-15",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Department of Justice",
          "Label_French_TXT" : "Ministu\u00E8re de la Justice"
        },
        {
          "Value_TXT" : "org-16",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Department of National Defence",
          "Label_French_TXT" : "Ministu\u00E8re de la D\u00E9fense nationale"
        },
        {
          "Value_TXT" : "org-17",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Département des ressources naturelles",
          "Label_French_TXT" : "Ministu\u00E8re des Ressources naturelles"
        },
        {
          "Value_TXT" : "org-18",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Département de la sécurité publique et de la préparation aux situations d'urgence",
          "Label_French_TXT" : "Ministu\u00E8re de la S\u00E9curit\u00E9 publique et de la Protection civile"
        },
        {
          "Value_TXT" : "org-19",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Département des travaux publics et des services gouvernementaux",
          "Label_French_TXT" : "Ministu\u00E8re des Travaux publics et des Services gouvernementaux"
        },
        {
          "Value_TXT" : "org-20",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Department of the Environment",
          "Label_French_TXT" : "Ministu00E8re de l\u0027Environnement"
        },
        {
          "Value_TXT" : "org-21",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Department of Transport",
          "Label_French_TXT" : "Ministu\u00E8re des Transports"
        },
        {
          "Value_TXT" : "org-22",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Department of Veterans Affairs",
          "Label_French_TXT" : "Ministu\u00E8re des Anciens Combattants"
        },
        {
          "Value_TXT" : "org-23",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Département de la diversification de l'économie de l'Ouest",
          "Label_French_TXT" : "Ministu\u00E8re de la Diversification de l\u0027\u00E9conomie de l\u0027Ouest canadien"
        },
        {
          "Value_TXT" : "org-24",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Treasury Board",
          "Label_French_TXT" : "Conseil du Tr\u00E9sor"
        },
        {
          "Value_TXT" : "org-25",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Service d'appui aux tribunaux administratifs du Canada",
          "Label_French_TXT" : "Service canadien d\u0027appui aux tribunaux administratifs"
        },
        {
          "Value_TXT" : "org-26",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Agence de promotion économique du Canada atlantique",
          "Label_French_TXT" : "Agence de promotion \u00E9conomique du Canada atlantique"
        },
        {
          "Value_TXT" : "org-27",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commission canadienne des grains",
          "Label_French_TXT" : "Commission canadienne des grains"
        },
        {
          "Value_TXT" : "org-28",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commission canadienne des droits de l'homme",
          "Label_French_TXT" : "Commission canadienne des droits de la personne"
        },
        {
          "Value_TXT" : "org-29",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Secrétariat des conférences intergouvernementales canadiennes",
          "Label_French_TXT" : "Secr\u00E9tariat des conf\u00E9rences intergouvernementales canadiennes"
        },
        {
          "Value_TXT" : "org-30",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Agence canadienne de développement économique du Nord",
          "Label_French_TXT" : "Agence canadienne de d\u00E9veloppement \u00E9conomique du Nord"
        },
        {
          "Value_TXT" : "org-31",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Conseil de la radiodiffusion et des télécommunications canadiennes",
          "Label_French_TXT" : "Conseil de la radiodiffusion et des tu00E9l\u00E9communications canadiennes"
        },
        {
          "Value_TXT" : "org-32",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Service canadien du renseignement de sécurité",
          "Label_French_TXT" : "Service canadien du renseignement de s\u00E9curitu\E9"
        },
        {
          "Value_TXT" : "org-33",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Agence spatiale canadienne",
          "Label_French_TXT" : "Agence spatiale canadienne"
        },
        {
          "Value_TXT" : "org-34",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Office des transports du Canada",
          "Label_French_TXT" : "Office des transports du Canada"
        },
        {
          "Value_TXT" : "org-35",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commission civile d'examen et de plaintes de la Gendarmerie royale du Canada",
          "Label_French_TXT" : "Commission civile d\u2019examen et de traitement des plaintes relatives \u00E0 la Gendarmerie royale du Canada ".
        },
        {
          "Value_TXT" : "org-36",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Communications Security Establishment",
          "Label_French_TXT" : "Centre de la s\u00E9curit\u00E9 des t\u00E9l\u00E9communications"
        },
        {
          "Value_TXT" : "org-37",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commission du droit d'auteur",
          "Label_French_TXT" : "Commission du droit d\u0027auteur"
        },
        {
          "Value_TXT" : "org-38",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Service correctionnel du Canada",
          "Label_French_TXT" : "Service correctionnel du Canada"
        },
        {
          "Value_TXT" : "org-39",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Courts Administration Service",
          "Label_French_TXT" : "Service administratif des tribunaux judiciaires"
        },
        {
          "Value_TXT" : "org-40",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Agence de développement économique du Canada pour les régions du Québec",
          "Label_French_TXT" : "Agence de d\u00E9veloppement \u00E9conomique du Canada pour les r\u00E9gions du Qu\u00E9bec"
        },
        {
          "Value_TXT" : "org-41",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Agence fédérale de développement économique pour le Nord de l'Ontario",
          "Label_French_TXT" : "Agence f\u00E9d\u00E9rale de d\u00E9veloppement \u00E9conomique pour le Nord de l\u0027Ontario"
        },
        {
          "Value_TXT" : "org-42",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Agence fédérale de développement économique pour le Sud de l'Ontario",
          "Label_French_TXT" : "Agence f\u00E9d\u00E9rale de d\u00E9veloppement \u00E9conomique pour le Sud de l\u0027Ontario"
        },
        {
          "Value_TXT" : "org-43",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Agence de la consommation en matière financière du Canada",
          "Label_French_TXT" : "Agence de la consommation en mati\u00E8re financi\u00E8re du Canada"
        },
        {
          "Value_TXT" : "org-44",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Centre d'analyse des opérations et déclarations financières du Canada",
          "Label_French_TXT" : "Centre d\u0027analyse des op\u00E9rations et d\u00E9clarations financi\u00E8res du Canada"
        },
        {
          "Value_TXT" : "org-45",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commission de l'immigration et du statut de réfugié",
          "Label_French_TXT" : "Commission de l\u0027immigration et du statut de r\u00E9fugi\u00E9"
        },
        {
          "Value_TXT" : "org-46",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Agence canadienne d'évaluation d'impact",
          "Label_French_TXT" : "Agence canadienne d\u0027\u00E9valuation d\u0027impact"
        },
        {
          "Value_TXT" : "org-47",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Leaders\u0027 Commission des débats",
          "Label_French_TXT" : "Commission des d\u00E9bats des chefs"
        },
        {
          "Value_TXT" : "org-48",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Bibliothèque et Archives du Canada",
          "Label_French_TXT" : "Bibliothu00E8que et Archives du Canada"
        },
        {
          "Value_TXT" : "org-49",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Comité d'examen externe des doléances des militaires",
          "Label_French_TXT" : "Comit\u00E9 externe d\u0027examen des griefs militaires"
        },
        {
          "Value_TXT" : "org-50",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commission d'examen des plaintes concernant la police militaire",
          "Label_French_TXT" : "Commission d\u0027examen des plaintes concernant la police militaire"
        },
        {
          "Value_TXT" : "org-51",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Conseil national des produits agricoles",
          "Label_French_TXT" : "Conseil national des produits agricoles"
        },
        {
          "Value_TXT" : "org-52",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Office national du film",
          "Label_French_TXT" : "Office national du film"
        },
        {
          "Value_TXT" : "org-53",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Secrétariat de l'Agence de surveillance de la sécurité nationale et du renseignement",
          "Label_French_TXT" : "Secr\u00E9tariat de l\u0027Office de surveillance des activit\u00E9s en mati\u00E8re de s\u00E9curit\u00E9 nationale et de renseignement"
        },
        {
          "Value_TXT" : "org-54",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Northern Pipeline Agency",
          "Label_French_TXT" : "Administration du pipe\u00AD-line du Nord"
        },
        {
          "Value_TXT" : "org-55",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Office des infrastructures du Canada",
          "Label_French_TXT" : "Bureau de l\u0027infrastructure du Canada"
        },
        {
          "Value_TXT" : "org-56",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Office of the Auditor General",
          "Label_French_TXT" : "Bureau du v\u00E9rificateur g\u00E9n\u00E9ral"
        },
        {
          "Value_TXT" : "org-57",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Office of the Chief Electoral Officer",
          "Label_French_TXT" : "Bureau du directeur général des \u00E9n\u00E9ral des \u00E9lections"
        },
        {
          "Value_TXT" : "org-58",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Bureau du Commissaire aux affaires judiciaires fédérales",
          "Label_French_TXT" : "Bureau du commissaire \u00E0 la magistrature f\u00E9d\u00E9rale"
        },
        {
          "Value_TXT" : "org-59",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commissariat au lobbying",
          "Label_French_TXT" : "Commissariat au lobbying"
        },
        {
          "Value_TXT" : "org-60",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commissariat aux langues officielles",
          "Label_French_TXT" : "Commissariat aux langues officielles"
        },
        {
          "Value_TXT" : "org-61",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Bureau de l'enquêteur correctionnel du Canada",
          "Label_French_TXT" : "Bureau de l\u0027enqu\u00EAteur correctionnel du Canada"
        },
        {
          "Value_TXT" : "org-62",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Office of the Director of Public Prosecutions",
          "Label_French_TXT" : "Bureau du directeur des poursuites p\u00E9nales"
        },
        {
          "Value_TXT" : "org-63",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Bureau du secrétaire du gouverneur général",
          "Label_French_TXT" : "Bureau du secr\u00E9taire du gouverneur g\u00E9n\u00E9ral"
        },
        {
          "Value_TXT" : "org-64",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Office of the Intelligence Commissioner",
          "Label_French_TXT" : "Bureau du commissaire au renseignement"
        },
        {
          "Value_TXT" : "org-65",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Office of the Public Sector Integrity Commissioner",
          "Label_French_TXT" : "Commissariat \u00E0 l\u0027int\u00E9grit\u00E9 du secteur public"
        },
        {
          "Value_TXT" : "org-66",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Bureau du surintendant des institutions financières",
          "Label_French_TXT" : "Bureau du surintendant des institutions financières"
        },
        {
          "Value_TXT" : "org-67",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commissariats à l'information et à la protection de la vie privée du Canada",
          "Label_French_TXT" : "Commissariats \u00E0 l\u0027information et \u00E0 la protection de la vie priv\u00E9e au Canada"
        },
        {
          "Value_TXT" : "org-68",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commissariats à l'information et à la protection de la vie privée du Canada",
          "Label_French_TXT" : "Commissariats \u00E0 l\u0027information et \u00E0 la protection de la vie priv\u00E9e au Canada"
        },
        {
          "Value_TXT" : "org-69",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Agence de développement économique du Canada pour le Pacifique",
          "Label_French_TXT" : "Agence de d\u00E9veloppement \u00E9conomique du Pacifique Canada"
        },
        {
          "Value_TXT" : "org-70",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commission des libérations conditionnelles du Canada",
          "Label_French_TXT" : "Commission des libu00E9rations conditionnelles du Canada"
        },
        {
          "Value_TXT" : "org-71",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Conseil d'examen du prix des médicaments brevetés",
          "Label_French_TXT" : "Conseil d\u0027examen du prix des mu00E9dicaments brevet\u00E9s"
        },
        {
          "Value_TXT" : "org-72",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Bureau du Conseil privé",
          "Label_French_TXT" : "Bureau du Conseil privu\u00E9"
        },
        {
          "Value_TXT" : "org-73",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Agence de santé publique du Canada",
          "Label_French_TXT" : "Agence de la sant\u00E9 publique du Canada"
        },
        {
          "Value_TXT" : "org-74",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commission de la fonction publique",
          "Label_French_TXT" : "Commission de la fonction publique"
        },
        {
          "Value_TXT" : "org-75",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Registrar of the Supreme Court of Canada and that portion of the federal public administration appointed under subsection 12(2) of the Supreme Court Act",
          "Label_French_TXT" : "Registraire de la Cour supr\u00EAme du Canada et le secteur de l\u0027administration publique f\u00E9d\u00E9rale nomm\u00E9 en vertu du paragraphe 12(2) de la Loi sur la Cour supr\u00EAme"
        },
        {
          "Value_TXT" : "org-76",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Royal Canadian Mounted Police",
          "Label_French_TXT" : "Gendarmerie royale du Canada"
        },
        {
          "Value_TXT" : "org-77",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Comité d'examen externe de la Gendarmerie royale du Canada",
          "Label_French_TXT" : "Comit\u00E9 externe d\u2019examen de la Gendarmerie royale du Canada"
        },
        {
          "Value_TXT" : "org-78",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Secrétariat du Comité parlementaire de la sécurité nationale et du renseignement",
          "Label_French_TXT" : "Secr\u00E9tariat du Comit\u00E9 des parlementaires sur la s\u00E9curit\u00E9 nationale et le renseignement"
        },
        {
          "Value_TXT" : "org-79",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Shared Services Canada",
          "Label_French_TXT" : "Services partag\u00E9s Canada"
        },
        {
          "Value_TXT" : "org-80",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Statistics Canada",
          "Label_French_TXT" : "Statistique Canada"
        },
        {
          "Value_TXT" : "org-81",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Tribunal des anciens combattants (révision et appel)",
          "Label_French_TXT" : "Tribunal des anciens combattants (r\u00E9vision et appel)"
        },
        {
          "Value_TXT" : "org-82",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Agence des services frontaliers du Canada",
          "Label_French_TXT" : "Agence des services frontaliers du Canada"
        },
        {
          "Value_TXT" : "org-83",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Agence canadienne pour l'incitation à la réduction des émissions",
          "Label_French_TXT" : "Agence canadienne pour l\u0027incitation \u00E0 la r\u00E9duction des \u00E9missions"
        },
        {
          "Value_TXT" : "org-84",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commission de l'assurance-emploi du Canada",
          "Label_French_TXT" : "Commission de l\u0027assurance-emploi du Canada"
        },
        {
          "Value_TXT" : "org-85",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Canada Revenue Agency",
          "Label_French_TXT" : "Agence du revenu du Canada"
        },
        {
          "Value_TXT" : "org-86",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "École de la fonction publique du Canada",
          "Label_French_TXT" : "\u00C9cole de la fonction publique du Canada"
        },
        {
          "Value_TXT" : "org-87",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Organisation canadienne d'élaboration des normes d'accessibilité",
          "Label_French_TXT" : "Organisation canadienne d\u0027\u00E9laboration de normes d\u0027accessibilit\u00E9"
        },
        {
          "Value_TXT" : "org-88",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Centre canadien d'hygiène et de sécurité au travail",
          "Label_French_TXT" : "Centre canadien d\u0027hygi\u00E8ne et de s\u00E9curitu\u00E9 au travail"
        },
        {
          "Value_TXT" : "org-89",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Régulateur canadien de l'énergie",
          "Label_French_TXT" : "R\u00E9gie canadienne de l\u0027\u00E9nergie"
        },
        {
          "Value_TXT" : "org-90",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Agence canadienne d'inspection des aliments",
          "Label_French_TXT" : "Agence canadienne d\u0027inspection des aliments"
        },
        {
          "Value_TXT" : "org-91",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Station de recherche du Haut-Arctique canadien",
          "Label_French_TXT" : "Station canadienne de recherche dans l\u2019Extru\00EAme-Arctique"
        },
        {
          "Value_TXT" : "org-92",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Instituts de recherche en santé du Canada",
          "Label_French_TXT" : "Instituts de recherche en sant\u00E9 du Canada"
        },
        {
          "Value_TXT" : "org-93",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commission canadienne de sûreté nucléaire",
          "Label_French_TXT" : "Commission canadienne de s\u00FBretu00E9 nucl\u00E9aire"
        },
        {
          "Value_TXT" : "org-94",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Bureau canadien d'enquête sur les accidents de transport et de la sécurité des transports",
          "Label_French_TXT" : "Bureau canadien d\u0027enqu\u00EAte sur les accidents de transport et de la s\u00E9curit\u00E9 des transports"
        },
        {
          "Value_TXT" : "org-95",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Invest in Canada Hub",
          "Label_French_TXT" : "Investir au Canada"
        },
        {
          "Value_TXT" : "org-96",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commission du droit du Canada",
          "Label_French_TXT" : "Commission du droit du Canada"
        },
        {
          "Value_TXT" : "org-97",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Conseil national de recherches du Canada",
          "Label_French_TXT" : "Conseil national de recherches du Canada"
        },
        {
          "Value_TXT" : "org-98",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Natural Sciences and Engineering Research Council",
          "Label_French_TXT" : "Conseil de recherches en sciences naturelles et en gu00E9nie"
        },
        {
          "Value_TXT" : "org-99",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Agence Parcs Canada",
          "Label_French_TXT" : "Agence Parcs Canada"
        },
        {
          "Value_TXT" : "org-100",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Conseil de recherche en sciences humaines",
          "Label_French_TXT" : "Conseil de recherches en sciences humaines"
        },
        {
          "Value_TXT" : "org-101",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commission des champs de bataille nationaux",
          "Label_French_TXT" : "Commission des champs de bataille nationaux"
        },
        {
          "Value_TXT" : "org-102",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Administration de pilotage de l'Atlantique",
          "Label_French_TXT" : "Administration de pilotage de l\u0027Atlantique"
        },
        {
          "Value_TXT" : "org-103",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Énergie atomique du Canada limitée",
          "Label_French_TXT" : "\u00C9nergie atomique du Canada, Limitu00E9e"
        },
        {
          "Value_TXT" : "org-104",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Banque de développement du Canada",
          "Label_French_TXT" : "Banque de d\u00E9veloppement du Canada"
        },
        {
          "Value_TXT" : "org-105",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Société d'assurance-dépôts du Canada",
          "Label_French_TXT" : "Sociu\u00E9t\u00E9 d\u0027assurance-d\u00E9p\u00F4ts du Canada"
        },
        {
          "Value_TXT" : "org-106",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Canada Infrastructure Bank",
          "Label_French_TXT" : "Banque de l\u2019infrastructure du Canada"
        },
        {
          "Value_TXT" : "org-107",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Société immobilière du Canada limitée",
          "Label_French_TXT" : "Sociu\u00E9t\u00E9 immobili\u00E8re du Canada Limitu\u00E9e"
        },
        {
          "Value_TXT" : "org-108",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Société canadienne d'hypothèques et de logement",
          "Label_French_TXT" : "Sociu\u00E9t\u00E9 canadienne d\u0027hypoth\u00E8ques et de logement"
        },
        {
          "Value_TXT" : "org-109",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Société canadienne des postes",
          "Label_French_TXT" : "Sociu\u00E9t\u00E9 canadienne des postes"
        },
        {
          "Value_TXT" : "org-110",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Administration canadienne de la sûreté du transport aérien",
          "Label_French_TXT" : "Administration canadienne de la s\u00FBretu\00E9 du transport a\u00E9rien"
        },
        {
          "Value_TXT" : "org-111",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Corporation commerciale canadienne",
          "Label_French_TXT" : "Corporation commerciale canadienne"
        },
        {
          "Value_TXT" : "org-112",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commission canadienne du lait",
          "Label_French_TXT" : "Commission canadienne du lait"
        },
        {
          "Value_TXT" : "org-113",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Musée canadien des droits de l'homme",
          "Label_French_TXT" : "Musu00E9e canadien des droits de la personne"
        },
        {
          "Value_TXT" : "org-114",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Musée canadien de l'histoire",
          "Label_French_TXT" : "Musu\u00E9e canadien de l\u0027histoire"
        },
        {
          "Value_TXT" : "org-115",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Musée canadien de l'immigration au Quai 21",
          "Label_French_TXT" : "Musu\u00E9e canadien de l\u0027immigration du Quai 21"
        },
        {
          "Value_TXT" : "org-116",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Musée canadien de la nature",
          "Label_French_TXT" : "Musu00E9e canadien de la nature"
        },
        {
          "Value_TXT" : "org-117",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commission canadienne du tourisme",
          "Label_French_TXT" : "Commission canadienne du tourisme"
        },
        {
          "Value_TXT" : "org-118",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Defence Construction (1951) Limited",
          "Label_French_TXT" : "Construction de d\u00E9fense (1951) Limitu00E9e"
        },
        {
          "Value_TXT" : "org-119",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Exportation et développement Canada",
          "Label_French_TXT" : "Exportation et d\u00E9veloppement Canada"
        },
        {
          "Value_TXT" : "org-120",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Financement agricole Canada",
          "Label_French_TXT" : "Financement agricole Canada"
        },
        {
          "Value_TXT" : "org-121",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Office de commercialisation du poisson d'eau douce",
          "Label_French_TXT" : "Office de commercialisation du poisson d\u0027eau douce"
        },
        {
          "Value_TXT" : "org-122",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Great Lakes Pilotage Authority",
          "Label_French_TXT" : "Administration de pilotage des Grands Lacs"
        },
        {
          "Value_TXT" : "org-123",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Administration de pilotage des Laurentides",
          "Label_French_TXT" : "Administration de pilotage des Laurentides"
        },
        {
          "Value_TXT" : "org-124",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Marine Atlantic Inc.",
          "Label_French_TXT" : "Marine Atlantique S.C.C."
        },
        {
          "Value_TXT" : "org-125",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Commission de la capitale nationale",
          "Label_French_TXT" : "Commission de la capitale nationale"
        },
        {
          "Value_TXT" : "org-126",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Musée des beaux-arts du Canada",
          "Label_French_TXT" : "Musu\00E9e des beaux-arts du Canada"
        },
        {
          "Value_TXT" : "org-127",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Musée national de la science et de la technologie",
          "Label_French_TXT" : "Musu\00E9e national des sciences et de la technologie"
        },
        {
          "Value_TXT" : "org-128",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Administration de pilotage du Pacifique",
          "Label_French_TXT" : "Administration de pilotage du Pacifique"
        },
        {
          "Value_TXT" : "org-129",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Conseil canadien des normes",
          "Label_French_TXT" : "Conseil canadien des normes"
        },
        {
          "Value_TXT" : "org-130",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "The Federal Bridge Corporation Limited",
          "Label_French_TXT" : "La Sociu\u00E9t\u00E9 des ponts f\u00E9d\u00E9raux Limitu00E9e"
        },
        {
          "Value_TXT" : "org-131",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Les Ponts Jacques-Cartier et Champlain Inc.",
          "Label_French_TXT" : "Les Ponts Jacques-Cartier et Champlain Inc."
        },
        {
          "Value_TXT" : "org-132",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "VIA Rail Canada Inc.",
          "Label_French_TXT" : "VIA Rail Canada Inc."
        },
        {
          "Value_TXT" : "org-133",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Windsor-Detroit Bridge Authority",
          "Label_French_TXT" : "Autorit\u00E9 du pont Windsor-D\u00E9troit"
        },
        {
          "Value_TXT" : "org-134",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Corporation de développement des investissements du Canada",
          "Label_French_TXT" : "Corporation d\u0027investissements au d\u00E9veloppement du Canada"
        },
        {
          "Value_TXT" : "org-135",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Monnaie royale canadienne",
          "Label_French_TXT" : "Monnaie royale canadienne"
        }
      ]
    },
    {
      "FieldDefinitionId" : 7,
      "Field_Name_TXT" : "security_classification",
      "Sort_Order_NUM" : 170,
      "Name_English_TXT" : "Security Categorization",
      "Name_French_TXT" : "Classification de s\u00E9curit\u00E9\u00A0",
      "English_DESC" : "Select the appropriate security categorization",
      "French_DESC" : "S\u00E9lectionnez la catu00E9gorisation de s\u00E9curit\u00E9 appropriu00E9e.",
      "Required_FLAG" : vrai,
      "MultiSelect_FLAG" : faux,
      "Validators_TXT" : null,
      "Custom_Field_FLAG" : faux,
      "Default_Value_TXT" : "0",
      "CascadeParentId" : null,
      "Choix" : [
        {
          "Value_TXT" : "0",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Unclassified",
          "Label_French_TXT" : "Non-classifi\u00E9"
        }
      ]
    },
    {
      "FieldDefinitionId" : 8,
      "Field_Name_TXT" : "subject",
      "Sort_Order_NUM" : 180,
      "Name_English_TXT" : "Subject",
      "Name_French_TXT" : "Sujet",
      "English_DESC" : "Le sujet du contenu de l'ensemble de données. Vous pouvez sélectionner ou désélectionner plusieurs sujets",
      "French_DESC" : "Le sujet du contenu du jeu de donnu\u00E9es. Vous pouvez s\u00E9lectionner ou d\u00E9s\u00E9lectionner de multiples sujets.",
      "Required_FLAG" : vrai,
      "MultiSelect_FLAG" : true,
      "Validators_TXT" : "",
      "Custom_Field_FLAG" : faux,
      "Default_Value_TXT" : null,
      "CascadeParentId" : null,
      "Choix" : [
        {
          "Value_TXT" : "arts_musique_littérature",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Arts, musique, littérature",
          "Label_French_TXT" : "Arts, musique, littu00E9rature"
        },
        {
          "Value_TXT" : "agriculture",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Agriculture",
          "Label_French_TXT" : "Agriculture"
        },
        {
          "Value_TXT" : "economics_and_industry",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Économie et industrie",
          "Label_French_TXT" : "\u00C9conomie et industrie"
        },
        {
          "Value_TXT" : "éducation_et_formation",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Éducation et formation",
          "Label_French_TXT" : "\u00C9ducation et formation"
        },
        {
          "Value_TXT" : "form_descriptors",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Form Descriptors",
          "Label_French_TXT" : "Format"
        },
        {
          "Value_TXT" : "government_and_politics",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Gouvernement et politique",
          "Label_French_TXT" : "Gouvernement et vie politique"
        },
        {
          "Value_TXT" : "santé_et_sécurité",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Santé et sécurité",
          "Label_French_TXT" : "Santu\u00E9 et s\u00E9curit\u00E9"
        },
        {
          "Value_TXT" : "history_and_archaeology",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Histoire et archéologie",
          "Label_French_TXT" : "Histoire et archu00E9ologie"
        },
        {
          "Value_TXT" : "information_et_communications",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Information et communications",
          "Label_French_TXT" : "Information et communication"
        },
        {
          "Value_TXT" : "travail",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Labour",
          "Label_French_TXT" : "Travail et emploi"
        },
        {
          "Value_TXT" : "langue_et_linguistique",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Langue et linguistique",
          "Label_French_TXT" : "Langue et linguistique"
        },
        {
          "Value_TXT" : "loi",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Law",
          "Label_French_TXT" : "Droit"
        },
        {
          "Value_TXT" : "militaire",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Military",
          "Label_French_TXT" : "Histoire et science militaire"
        },
        {
          "Value_TXT" : "nature_et_environnement",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Nature et environnement",
          "Label_French_TXT" : "Nature et environnement"
        },
        {
          "Value_TXT" : "personnes",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Persons",
          "Label_French_TXT" : "Personnes"
        },
        {
          "Value_TXT" : "processus",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Processus",
          "Label_French_TXT" : "Liens et fonctions"
        },
        {
          "Value_TXT" : "société_et_culture",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Société et culture",
          "Label_French_TXT" : "Sociu\u00E9t\u00E9 et culture"
        },
        {
          "Value_TXT" : "science_et_technologie",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Science et technologie",
          "Label_French_TXT" : "Sciences et technologie"
        },
        {
          "Value_TXT" : "transport",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Transport",
          "Label_French_TXT" : "Transport"
        }
      ]
    },
    {
      "FieldDefinitionId" : 9,
      "Field_Name_TXT" : "keywords_fr",
      "Sort_Order_NUM" : 190,
      "Name_English_TXT" : "Mots-clés (anglais)",
      "Name_French_TXT" : "Mots cl\u00E9s (anglais)",
      "English_DESC" : "Mots ou phrases couramment utilisés pour décrire l'ensemble de données, en anglais. (Séparer les entrées multiples par des virgules)",
      "French_DESC" : "Mots ou phrases couramment utilis\u00E9s qui d\u00E9crivent le jeu de donnu\u00E9es, en anglais. (S\u00E9parer les mots ou phrases par une virgule)",
      "Required_FLAG" : vrai,
      "MultiSelect_FLAG" : faux,
      "Validators_TXT" : "fluent_tags",
      "Custom_Field_FLAG" : faux,
      "Default_Value_TXT" : null,
      "CascadeParentId" : null,
      "Choix" : []
    },
    {
      "FieldDefinitionId" : 10,
      "Field_Name_TXT" : "keywords_fr",
      "Sort_Order_NUM" : 200,
      "Name_English_TXT" : "Mots-clés (français)",
      "Name_French_TXT" : "Mots cl\u00E9s (fran\u00E7ais)",
      "English_DESC" : "Mots ou phrases couramment utilisés pour décrire le jeu de données, en français. (Séparer les entrées multiples par des virgules)",
      "French_DESC" : "Mots ou phrases couramment utilis\u00E9s qui d\u00E9crivent le jeu de donnu\u00E9es, en fran\u00E7ais. (S\u00E9parer les mots ou phrases par une virgule)",
      "Required_FLAG" : vrai,
      "MultiSelect_FLAG" : faux,
      "Validators_TXT" : "fluent_tags",
      "Custom_Field_FLAG" : faux,
      "Default_Value_TXT" : null,
      "CascadeParentId" : null,
      "Choix" : []
    },
    {
      "FieldDefinitionId" : 11,
      "Field_Name_TXT" : "access_restrictions",
      "Sort_Order_NUM" : 210,
      "Name_English_TXT" : "Access Restrictions",
      "Name_French_TXT" : "Restrictions d\u0027acc\u00E8s",
      "English_DESC" : "Les restrictions d'accès à l'espace de travail",
      "French_DESC" : "Les restrictions d\u0027acc\u00E8s \u00E0 l\u0027espace de travail",
      "Required_FLAG" : vrai,
      "MultiSelect_FLAG" : faux,
      "Validators_TXT" : "",
      "Custom_Field_FLAG" : faux,
      "Default_Value_TXT" : null,
      "CascadeParentId" : null,
      "Choix" : [
        {
          "Value_TXT" : "unrestricted",
          "Cascading_Value_TXT" : null,
          "Label_English_TXT" : "Unrestricted",
          "Label_French_TXT" : "Non affectu00E9"
        }
      ]
    },
    {
      "FieldDefinitionId" : 12,
      "Field_Name_TXT" : "creator",
      "Sort_Order_NUM" : 250,
      "Name_English_TXT" : "Nom du responsable de l'espace de travail",
      "Name_French_TXT" : "Nom du prospect de l\u0027espace de travail",
      "English_DESC" : null,
      "French_DESC" : null,
      "Required_FLAG" : vrai,
      "MultiSelect_FLAG" : faux,
      "Validators_TXT" : null,
      "Custom_Field_FLAG" : faux,
      "Default_Value_TXT" : null,
      "CascadeParentId" : null,
      "Choix" : []
    },
    {
      "FieldDefinitionId" : 13,
      "Field_Name_TXT" : "contact_email",
      "Sort_Order_NUM" : 260,
      "Name_English_TXT" : "Email du responsable de l'espace de travail",
      "Name_French_TXT" : "E-mail du responsable de l\u0027espace de travail",
      "English_DESC" : null,
      "French_DESC" : null,
      "Required_FLAG" : vrai,
      "MultiSelect_FLAG" : faux,
      "Validators_TXT" : null,
      "Custom_Field_FLAG" : faux,
      "Default_Value_TXT" : null,
      "CascadeParentId" : null,
      "Choix" : []
    }
  ]
}
```
