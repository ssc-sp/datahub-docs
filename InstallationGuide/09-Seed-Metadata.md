## Seed the Metadata

### Option 1

**On the development enviroment**
- Go to the **Admin** page.
- Find the **Metadata Management** card and click **Open Page**
- On the Metadata page navigate to the bottom.
- Click **Download** and save the JSON to a file.

**On the seeding enviroment**
- Open the **Admin** page.
- Find the **Metadata Management** card and click **Open Page**
- On the Metadata page navigate to the bottom.
- Click **Upload** and select the file you just downloaded.

### Option 2
- Copy the code below and save it to a JSON file.
- In the new Web Application go to the **Admin** page
- Find the **Metadata Management** card and click **Open Page**
- On the Metadata page navigate to the bottom
- Click **Upload** and select the file containing the JSON below.

```
{
  "Profiles": [
    {
      "Name": "project",
      "Sections": [
        {
          "Name_English_TXT": "General",
          "Name_French_TXT": "General",
          "Fields": [
            {
              "FieldDefinitionId": 1,
              "Required_FLAG": true
            },
            {
              "FieldDefinitionId": 2,
              "Required_FLAG": true
            },
            {
              "FieldDefinitionId": 4,
              "Required_FLAG": true
            },
            {
              "FieldDefinitionId": 5,
              "Required_FLAG": true
            },
            {
              "FieldDefinitionId": 6,
              "Required_FLAG": true
            },
            {
              "FieldDefinitionId": 7,
              "Required_FLAG": true
            },
            {
              "FieldDefinitionId": 8,
              "Required_FLAG": true
            },
            {
              "FieldDefinitionId": 9,
              "Required_FLAG": true
            },
            {
              "FieldDefinitionId": 10,
              "Required_FLAG": true
            },
            {
              "FieldDefinitionId": 11,
              "Required_FLAG": true
            },
            {
              "FieldDefinitionId": 12,
              "Required_FLAG": true
            },
            {
              "FieldDefinitionId": 13,
              "Required_FLAG": true
            }
          ]
        }
      ]
    }
  ],
  "Definitions": [
    {
      "FieldDefinitionId": 1,
      "Field_Name_TXT": "name_en",
      "Sort_Order_NUM": 100,
      "Name_English_TXT": "Workspace Name (English)",
      "Name_French_TXT": "Nom de l\u2019espace de travail (Anglais)",
      "English_DESC": "",
      "French_DESC": "",
      "Required_FLAG": true,
      "MultiSelect_FLAG": false,
      "Validators_TXT": null,
      "Custom_Field_FLAG": false,
      "Default_Value_TXT": null,
      "CascadeParentId": null,
      "Choices": []
    },
    {
      "FieldDefinitionId": 2,
      "Field_Name_TXT": "name_fr",
      "Sort_Order_NUM": 110,
      "Name_English_TXT": "Workspace Name (French)",
      "Name_French_TXT": "Nom de l\u2019espace de travail (Fran\u00E7ais)",
      "English_DESC": "",
      "French_DESC": "",
      "Required_FLAG": true,
      "MultiSelect_FLAG": false,
      "Validators_TXT": null,
      "Custom_Field_FLAG": false,
      "Default_Value_TXT": null,
      "CascadeParentId": null,
      "Choices": []
    },
    {
      "FieldDefinitionId": 3,
      "Field_Name_TXT": "acronym",
      "Sort_Order_NUM": 120,
      "Name_English_TXT": "Workspace Acronym",
      "Name_French_TXT": "Acronyme de l\u2019espace de travail",
      "English_DESC": "",
      "French_DESC": "",
      "Required_FLAG": true,
      "MultiSelect_FLAG": false,
      "Validators_TXT": null,
      "Custom_Field_FLAG": false,
      "Default_Value_TXT": null,
      "CascadeParentId": null,
      "Choices": []
    },
    {
      "FieldDefinitionId": 4,
      "Field_Name_TXT": "description_en",
      "Sort_Order_NUM": 130,
      "Name_English_TXT": "Workspace Description (English)",
      "Name_French_TXT": "Description de l\u2019espace de travail (Anglais)",
      "English_DESC": "",
      "French_DESC": "",
      "Required_FLAG": true,
      "MultiSelect_FLAG": false,
      "Validators_TXT": null,
      "Custom_Field_FLAG": false,
      "Default_Value_TXT": null,
      "CascadeParentId": null,
      "Choices": []
    },
    {
      "FieldDefinitionId": 5,
      "Field_Name_TXT": "description_fr",
      "Sort_Order_NUM": 140,
      "Name_English_TXT": "Workspace Description (French)",
      "Name_French_TXT": "Description de l\u2019espace de travail (Fran\u00E7ais)",
      "English_DESC": "",
      "French_DESC": "",
      "Required_FLAG": true,
      "MultiSelect_FLAG": false,
      "Validators_TXT": null,
      "Custom_Field_FLAG": false,
      "Default_Value_TXT": null,
      "CascadeParentId": null,
      "Choices": []
    },
    {
      "FieldDefinitionId": 6,
      "Field_Name_TXT": "organization_name",
      "Sort_Order_NUM": 150,
      "Name_English_TXT": "Organization Name",
      "Name_French_TXT": "Nom de l\u2019organisation",
      "English_DESC": "",
      "French_DESC": "",
      "Required_FLAG": true,
      "MultiSelect_FLAG": false,
      "Validators_TXT": null,
      "Custom_Field_FLAG": false,
      "Default_Value_TXT": null,
      "CascadeParentId": null,
      "Choices": [
        {
          "Value_TXT": "org-1",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Government of Canada",
          "Label_French_TXT": "Gouvernement du Canada"
        },
        {
          "Value_TXT": "org-2",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Treasury Board Secretariat",
          "Label_French_TXT": "Secr\u00E9tariat du Conseil du Tr\u00E9sor"
        },
        {
          "Value_TXT": "org-3",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department for Women and Gender Equality",
          "Label_French_TXT": "Minist\u00E8re des Femmes et de l\u0027\u00C9galit\u00E9 des genres"
        },
        {
          "Value_TXT": "org-4",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Agriculture and Agri-Food",
          "Label_French_TXT": "Minist\u00E8re de l\u0027Agriculture et de l\u0027Agroalimentaire"
        },
        {
          "Value_TXT": "org-5",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Canadian Heritage",
          "Label_French_TXT": "Minist\u00E8re du Patrimoine canadien"
        },
        {
          "Value_TXT": "org-6",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Citizenship and Immigration",
          "Label_French_TXT": "Minist\u00E8re de la Citoyennet\u00E9 et de l\u0027Immigration"
        },
        {
          "Value_TXT": "org-7",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Crown-Indigenous Relations and Northern Affairs",
          "Label_French_TXT": "Minist\u00E8re des Relations Couronne-Autochtones et des Affaires du Nord"
        },
        {
          "Value_TXT": "org-8",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Employment and Social Development",
          "Label_French_TXT": "Minist\u00E8re de l\u0027Emploi et du D\u00E9veloppement social"
        },
        {
          "Value_TXT": "org-9",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Finance",
          "Label_French_TXT": "Minist\u00E8re des Finances"
        },
        {
          "Value_TXT": "org-10",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Fisheries and Oceans",
          "Label_French_TXT": "Minist\u00E8re des P\u00EAches et des Oc\u00E9ans"
        },
        {
          "Value_TXT": "org-11",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Foreign Affairs, Trade and Development",
          "Label_French_TXT": "Minist\u00E8re des Affaires \u00E9trang\u00E8res, du Commerce et du D\u00E9veloppement"
        },
        {
          "Value_TXT": "org-12",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Health",
          "Label_French_TXT": "Minist\u00E8re de la Sant\u00E9"
        },
        {
          "Value_TXT": "org-13",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Indigenous Services",
          "Label_French_TXT": "Minist\u00E8re des Services aux Autochtones"
        },
        {
          "Value_TXT": "org-14",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Industry",
          "Label_French_TXT": "Minist\u00E8re de l\u0027Industrie"
        },
        {
          "Value_TXT": "org-15",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Justice",
          "Label_French_TXT": "Minist\u00E8re de la Justice"
        },
        {
          "Value_TXT": "org-16",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of National Defence",
          "Label_French_TXT": "Minist\u00E8re de la D\u00E9fense nationale"
        },
        {
          "Value_TXT": "org-17",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Natural Resources",
          "Label_French_TXT": "Minist\u00E8re des Ressources naturelles"
        },
        {
          "Value_TXT": "org-18",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Public Safety and Emergency Preparedness",
          "Label_French_TXT": "Minist\u00E8re de la S\u00E9curit\u00E9 publique et de la Protection civile"
        },
        {
          "Value_TXT": "org-19",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Public Works and Government Services",
          "Label_French_TXT": "Minist\u00E8re des Travaux publics et des Services gouvernementaux"
        },
        {
          "Value_TXT": "org-20",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of the Environment",
          "Label_French_TXT": "Minist\u00E8re de l\u0027Environnement"
        },
        {
          "Value_TXT": "org-21",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Transport",
          "Label_French_TXT": "Minist\u00E8re des Transports"
        },
        {
          "Value_TXT": "org-22",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Veterans Affairs",
          "Label_French_TXT": "Minist\u00E8re des Anciens Combattants"
        },
        {
          "Value_TXT": "org-23",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Department of Western Economic Diversification",
          "Label_French_TXT": "Minist\u00E8re de la Diversification de l\u0027\u00E9conomie de l\u0027Ouest canadien"
        },
        {
          "Value_TXT": "org-24",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Treasury Board",
          "Label_French_TXT": "Conseil du Tr\u00E9sor"
        },
        {
          "Value_TXT": "org-25",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Administrative Tribunals Support Service of Canada",
          "Label_French_TXT": "Service canadien d\u0027appui aux tribunaux administratifs"
        },
        {
          "Value_TXT": "org-26",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Atlantic Canada Opportunities Agency",
          "Label_French_TXT": "Agence de promotion \u00E9conomique du Canada atlantique"
        },
        {
          "Value_TXT": "org-27",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Grain Commission",
          "Label_French_TXT": "Commission canadienne des grains"
        },
        {
          "Value_TXT": "org-28",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Human Rights Commission",
          "Label_French_TXT": "Commission canadienne des droits de la personne"
        },
        {
          "Value_TXT": "org-29",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Intergovernmental Conference Secretariat",
          "Label_French_TXT": "Secr\u00E9tariat des conf\u00E9rences intergouvernementales canadiennes"
        },
        {
          "Value_TXT": "org-30",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Northern Economic Development Agency",
          "Label_French_TXT": "Agence canadienne de d\u00E9veloppement \u00E9conomique du Nord "
        },
        {
          "Value_TXT": "org-31",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Radio-\u00ADtelevision and Telecommunications Commission",
          "Label_French_TXT": "Conseil de la radiodiffusion et des t\u00E9l\u00E9communications canadiennes"
        },
        {
          "Value_TXT": "org-32",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Security Intelligence Service",
          "Label_French_TXT": "Service canadien du renseignement de s\u00E9curit\u00E9"
        },
        {
          "Value_TXT": "org-33",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Space Agency",
          "Label_French_TXT": "Agence spatiale canadienne"
        },
        {
          "Value_TXT": "org-34",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Transportation Agency",
          "Label_French_TXT": "Office des transports du Canada"
        },
        {
          "Value_TXT": "org-35",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Civilian Review and Complaints Commission for the Royal Canadian Mounted Police",
          "Label_French_TXT": "Commission civile d\u2019examen et de traitement des plaintes relatives \u00E0 la Gendarmerie royale du Canada "
        },
        {
          "Value_TXT": "org-36",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Communications Security Establishment",
          "Label_French_TXT": "Centre de la s\u00E9curit\u00E9 des t\u00E9l\u00E9communications"
        },
        {
          "Value_TXT": "org-37",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Copyright Board",
          "Label_French_TXT": "Commission du droit d\u0027auteur"
        },
        {
          "Value_TXT": "org-38",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Correctional Service of Canada",
          "Label_French_TXT": "Service correctionnel du Canada"
        },
        {
          "Value_TXT": "org-39",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Courts Administration Service",
          "Label_French_TXT": "Service administratif des tribunaux judiciaires"
        },
        {
          "Value_TXT": "org-40",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Economic Development Agency of Canada for the Regions of Quebec",
          "Label_French_TXT": "Agence de d\u00E9veloppement \u00E9conomique du Canada pour les r\u00E9gions du Qu\u00E9bec"
        },
        {
          "Value_TXT": "org-41",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Federal Economic Development Agency for Northern Ontario",
          "Label_French_TXT": "Agence f\u00E9d\u00E9rale de d\u00E9veloppement \u00E9conomique pour le Nord de l\u0027Ontario"
        },
        {
          "Value_TXT": "org-42",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Federal Economic Development Agency for Southern Ontario",
          "Label_French_TXT": "Agence f\u00E9d\u00E9rale de d\u00E9veloppement \u00E9conomique pour le Sud de l\u0027Ontario"
        },
        {
          "Value_TXT": "org-43",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Financial Consumer Agency of Canada",
          "Label_French_TXT": "Agence de la consommation en mati\u00E8re financi\u00E8re du Canada"
        },
        {
          "Value_TXT": "org-44",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Financial Transactions and Reports Analysis Centre of Canada",
          "Label_French_TXT": "Centre d\u0027analyse des op\u00E9rations et d\u00E9clarations financi\u00E8res du Canada"
        },
        {
          "Value_TXT": "org-45",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Immigration and Refugee Board",
          "Label_French_TXT": "Commission de l\u0027immigration et du statut de r\u00E9fugi\u00E9"
        },
        {
          "Value_TXT": "org-46",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Impact Assessment Agency of Canada",
          "Label_French_TXT": "Agence canadienne d\u0027\u00E9valuation d\u0027impact"
        },
        {
          "Value_TXT": "org-47",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Leaders\u0027 Debates Commission ",
          "Label_French_TXT": "Commission des d\u00E9bats des chefs"
        },
        {
          "Value_TXT": "org-48",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Library and Archives of Canada",
          "Label_French_TXT": "Biblioth\u00E8que et Archives du Canada"
        },
        {
          "Value_TXT": "org-49",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Military Grievances External Review Committee",
          "Label_French_TXT": "Comit\u00E9 externe d\u0027examen des griefs militaires"
        },
        {
          "Value_TXT": "org-50",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Military Police Complaints Commission",
          "Label_French_TXT": "Commission d\u0027examen des plaintes concernant la police militaire"
        },
        {
          "Value_TXT": "org-51",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "National Farm Products Council",
          "Label_French_TXT": "Conseil national des produits agricoles"
        },
        {
          "Value_TXT": "org-52",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "National Film Board",
          "Label_French_TXT": "Office national du film"
        },
        {
          "Value_TXT": "org-53",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "National Security and Intelligence Review Agency Secretariat",
          "Label_French_TXT": "Secr\u00E9tariat de l\u0027Office de surveillance des activit\u00E9s en mati\u00E8re de s\u00E9curit\u00E9 nationale et de renseignement"
        },
        {
          "Value_TXT": "org-54",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Northern Pipeline Agency",
          "Label_French_TXT": "Administration du pipe\u00AD-line du Nord"
        },
        {
          "Value_TXT": "org-55",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Office of Infrastructure of Canada",
          "Label_French_TXT": "Bureau de l\u0027infrastructure du Canada"
        },
        {
          "Value_TXT": "org-56",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Office of the Auditor General",
          "Label_French_TXT": "Bureau du v\u00E9rificateur g\u00E9n\u00E9ral"
        },
        {
          "Value_TXT": "org-57",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Office of the Chief Electoral Officer",
          "Label_French_TXT": "Bureau du directeur g\u00E9n\u00E9ral des \u00E9lections"
        },
        {
          "Value_TXT": "org-58",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Office of the Commissioner for Federal Judicial Affairs",
          "Label_French_TXT": "Bureau du commissaire \u00E0 la magistrature f\u00E9d\u00E9rale"
        },
        {
          "Value_TXT": "org-59",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Office of the Commissioner of Lobbying",
          "Label_French_TXT": "Commissariat au lobbying"
        },
        {
          "Value_TXT": "org-60",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Office of the Commissioner of Official Languages",
          "Label_French_TXT": "Commissariat aux langues officielles"
        },
        {
          "Value_TXT": "org-61",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Office of the Correctional Investigator of Canada",
          "Label_French_TXT": "Bureau de l\u0027enqu\u00EAteur correctionnel du Canada"
        },
        {
          "Value_TXT": "org-62",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Office of the Director of Public Prosecutions",
          "Label_French_TXT": "Bureau du directeur des poursuites p\u00E9nales"
        },
        {
          "Value_TXT": "org-63",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Office of the Governor General\u0027s Secretary",
          "Label_French_TXT": "Bureau du secr\u00E9taire du gouverneur g\u00E9n\u00E9ral"
        },
        {
          "Value_TXT": "org-64",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Office of the Intelligence Commissioner",
          "Label_French_TXT": "Bureau du commissaire au renseignement"
        },
        {
          "Value_TXT": "org-65",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Office of the Public Sector Integrity Commissioner",
          "Label_French_TXT": "Commissariat \u00E0 l\u0027int\u00E9grit\u00E9 du secteur public"
        },
        {
          "Value_TXT": "org-66",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Office of the Superintendent of Financial Institutions",
          "Label_French_TXT": "Bureau du surintendant des institutions financi\u00E8res"
        },
        {
          "Value_TXT": "org-67",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Offices of the Information and Privacy Commissioners of Canada",
          "Label_French_TXT": "Commissariats \u00E0 l\u0027information et \u00E0 la protection de la vie priv\u00E9e au Canada"
        },
        {
          "Value_TXT": "org-68",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Offices of the Information and Privacy Commissioners of Canada",
          "Label_French_TXT": "Commissariats \u00E0 l\u0027information et \u00E0 la protection de la vie priv\u00E9e au Canada"
        },
        {
          "Value_TXT": "org-69",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Pacific Economic Development Agency of Canada",
          "Label_French_TXT": "Agence de d\u00E9veloppement \u00E9conomique du Pacifique Canada"
        },
        {
          "Value_TXT": "org-70",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Parole Board of Canada",
          "Label_French_TXT": "Commission des lib\u00E9rations conditionnelles du Canada"
        },
        {
          "Value_TXT": "org-71",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Patented Medicine Prices Review Board",
          "Label_French_TXT": "Conseil d\u0027examen du prix des m\u00E9dicaments brevet\u00E9s"
        },
        {
          "Value_TXT": "org-72",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Privy Council Office",
          "Label_French_TXT": "Bureau du Conseil priv\u00E9"
        },
        {
          "Value_TXT": "org-73",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Public Health Agency of Canada",
          "Label_French_TXT": "Agence de la sant\u00E9 publique du Canada"
        },
        {
          "Value_TXT": "org-74",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Public Service Commission",
          "Label_French_TXT": "Commission de la fonction publique"
        },
        {
          "Value_TXT": "org-75",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Registrar of the Supreme Court of Canada and that portion of the federal public administration appointed under subsection 12(2) of the Supreme Court Act",
          "Label_French_TXT": "Registraire de la Cour supr\u00EAme du Canada et le secteur de l\u0027administration publique f\u00E9d\u00E9rale nomm\u00E9 en vertu du paragraphe 12(2) de la Loi sur la Cour supr\u00EAme"
        },
        {
          "Value_TXT": "org-76",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Royal Canadian Mounted Police",
          "Label_French_TXT": "Gendarmerie royale du Canada"
        },
        {
          "Value_TXT": "org-77",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Royal Canadian Mounted Police External Review Committee",
          "Label_French_TXT": "Comit\u00E9 externe d\u2019examen de la Gendarmerie royale du Canada"
        },
        {
          "Value_TXT": "org-78",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Secretariat of the National Security and Intelligence Committee of Parliamentarians",
          "Label_French_TXT": "Secr\u00E9tariat du Comit\u00E9 des parlementaires sur la s\u00E9curit\u00E9 nationale et le renseignement"
        },
        {
          "Value_TXT": "org-79",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Shared Services Canada",
          "Label_French_TXT": "Services partag\u00E9s Canada"
        },
        {
          "Value_TXT": "org-80",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Statistics Canada",
          "Label_French_TXT": "Statistique Canada"
        },
        {
          "Value_TXT": "org-81",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Veterans Review and Appeal Board",
          "Label_French_TXT": "Tribunal des anciens combattants (r\u00E9vision et appel)"
        },
        {
          "Value_TXT": "org-82",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canada Border Services Agency",
          "Label_French_TXT": "Agence des services frontaliers du Canada"
        },
        {
          "Value_TXT": "org-83",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canada Emission Reduction Incentives Agency",
          "Label_French_TXT": "Agence canadienne pour l\u0027incitation \u00E0 la r\u00E9duction des \u00E9missions"
        },
        {
          "Value_TXT": "org-84",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canada Employment Insurance Commission",
          "Label_French_TXT": "Commission de l\u0027assurance-emploi du Canada"
        },
        {
          "Value_TXT": "org-85",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canada Revenue Agency",
          "Label_French_TXT": "Agence du revenu du Canada"
        },
        {
          "Value_TXT": "org-86",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canada School of Public Service",
          "Label_French_TXT": "\u00C9cole de la fonction publique du Canada"
        },
        {
          "Value_TXT": "org-87",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Accessibility Standards Development Organization",
          "Label_French_TXT": "Organisation canadienne d\u0027\u00E9laboration de normes d\u0027accessibilit\u00E9"
        },
        {
          "Value_TXT": "org-88",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Centre for Occupational Health and Safety",
          "Label_French_TXT": "Centre canadien d\u0027hygi\u00E8ne et de s\u00E9curit\u00E9 au travail"
        },
        {
          "Value_TXT": "org-89",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Energy Regulator",
          "Label_French_TXT": "R\u00E9gie canadienne de l\u0027\u00E9nergie"
        },
        {
          "Value_TXT": "org-90",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Food Inspection Agency",
          "Label_French_TXT": "Agence canadienne d\u0027inspection des aliments"
        },
        {
          "Value_TXT": "org-91",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian High Arctic Research Station",
          "Label_French_TXT": "Station canadienne de recherche dans l\u2019Extr\u00EAme-Arctique"
        },
        {
          "Value_TXT": "org-92",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Institutes of Health Research",
          "Label_French_TXT": "Instituts de recherche en sant\u00E9 du Canada"
        },
        {
          "Value_TXT": "org-93",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Nuclear Safety Commission",
          "Label_French_TXT": "Commission canadienne de s\u00FBret\u00E9 nucl\u00E9aire"
        },
        {
          "Value_TXT": "org-94",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Transportation Accident Investigation and Safety Board",
          "Label_French_TXT": "Bureau canadien d\u0027enqu\u00EAte sur les accidents de transport et de la s\u00E9curit\u00E9 des transports"
        },
        {
          "Value_TXT": "org-95",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Invest in Canada Hub",
          "Label_French_TXT": "Investir au Canada"
        },
        {
          "Value_TXT": "org-96",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Law Commission of Canada",
          "Label_French_TXT": "Commission du droit du Canada"
        },
        {
          "Value_TXT": "org-97",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "National Research Council of Canada",
          "Label_French_TXT": "Conseil national de recherches du Canada"
        },
        {
          "Value_TXT": "org-98",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Natural Sciences and Engineering Research Council",
          "Label_French_TXT": "Conseil de recherches en sciences naturelles et en g\u00E9nie"
        },
        {
          "Value_TXT": "org-99",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Parks Canada Agency",
          "Label_French_TXT": "Agence Parcs Canada"
        },
        {
          "Value_TXT": "org-100",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Social Sciences and Humanities Research Council",
          "Label_French_TXT": "Conseil de recherches en sciences humaines"
        },
        {
          "Value_TXT": "org-101",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "The National Battlefields Commission",
          "Label_French_TXT": "Commission des champs de bataille nationaux"
        },
        {
          "Value_TXT": "org-102",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Atlantic Pilotage Authority",
          "Label_French_TXT": "Administration de pilotage de l\u0027Atlantique"
        },
        {
          "Value_TXT": "org-103",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Atomic Energy of Canada Limited",
          "Label_French_TXT": "\u00C9nergie atomique du Canada, Limit\u00E9e"
        },
        {
          "Value_TXT": "org-104",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Business Development Bank of Canada",
          "Label_French_TXT": "Banque de d\u00E9veloppement du Canada"
        },
        {
          "Value_TXT": "org-105",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canada Deposit Insurance Corporation",
          "Label_French_TXT": "Soci\u00E9t\u00E9 d\u0027assurance-d\u00E9p\u00F4ts du Canada"
        },
        {
          "Value_TXT": "org-106",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canada Infrastructure Bank",
          "Label_French_TXT": "Banque de l\u2019infrastructure du Canada"
        },
        {
          "Value_TXT": "org-107",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canada Lands Company Limited",
          "Label_French_TXT": "Soci\u00E9t\u00E9 immobili\u00E8re du Canada Limit\u00E9e"
        },
        {
          "Value_TXT": "org-108",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canada Mortgage and Housing Corporation",
          "Label_French_TXT": "Soci\u00E9t\u00E9 canadienne d\u0027hypoth\u00E8ques et de logement"
        },
        {
          "Value_TXT": "org-109",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canada Post Corporation",
          "Label_French_TXT": "Soci\u00E9t\u00E9 canadienne des postes"
        },
        {
          "Value_TXT": "org-110",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Air Transport Security Authority",
          "Label_French_TXT": "Administration canadienne de la s\u00FBret\u00E9 du transport a\u00E9rien"
        },
        {
          "Value_TXT": "org-111",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Commercial Corporation",
          "Label_French_TXT": "Corporation commerciale canadienne"
        },
        {
          "Value_TXT": "org-112",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Dairy Commission",
          "Label_French_TXT": "Commission canadienne du lait"
        },
        {
          "Value_TXT": "org-113",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Museum for Human Rights",
          "Label_French_TXT": "Mus\u00E9e canadien des droits de la personne"
        },
        {
          "Value_TXT": "org-114",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Museum of History",
          "Label_French_TXT": "Mus\u00E9e canadien de l\u0027histoire"
        },
        {
          "Value_TXT": "org-115",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Museum of Immigration at Pier 21",
          "Label_French_TXT": "Mus\u00E9e canadien de l\u0027immigration du Quai 21"
        },
        {
          "Value_TXT": "org-116",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Museum of Nature",
          "Label_French_TXT": "Mus\u00E9e canadien de la nature"
        },
        {
          "Value_TXT": "org-117",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canadian Tourism Commission",
          "Label_French_TXT": "Commission canadienne du tourisme"
        },
        {
          "Value_TXT": "org-118",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Defence Construction (1951) Limited",
          "Label_French_TXT": "Construction de d\u00E9fense (1951) Limit\u00E9e"
        },
        {
          "Value_TXT": "org-119",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Export Development Canada",
          "Label_French_TXT": "Exportation et d\u00E9veloppement Canada"
        },
        {
          "Value_TXT": "org-120",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Farm Credit Canada",
          "Label_French_TXT": "Financement agricole Canada"
        },
        {
          "Value_TXT": "org-121",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Freshwater Fish Marketing Corporation",
          "Label_French_TXT": "Office de commercialisation du poisson d\u0027eau douce"
        },
        {
          "Value_TXT": "org-122",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Great Lakes Pilotage Authority",
          "Label_French_TXT": "Administration de pilotage des Grands Lacs"
        },
        {
          "Value_TXT": "org-123",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Laurentian Pilotage Authority",
          "Label_French_TXT": "Administration de pilotage des Laurentides"
        },
        {
          "Value_TXT": "org-124",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Marine Atlantic Inc.",
          "Label_French_TXT": "Marine Atlantique S.C.C."
        },
        {
          "Value_TXT": "org-125",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "National Capital Commission",
          "Label_French_TXT": "Commission de la capitale nationale"
        },
        {
          "Value_TXT": "org-126",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "National Gallery of Canada",
          "Label_French_TXT": "Mus\u00E9e des beaux-arts du Canada"
        },
        {
          "Value_TXT": "org-127",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "National Museum of Science and Technology",
          "Label_French_TXT": "Mus\u00E9e national des sciences et de la technologie"
        },
        {
          "Value_TXT": "org-128",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Pacific Pilotage Authority",
          "Label_French_TXT": "Administration de pilotage du Pacifique"
        },
        {
          "Value_TXT": "org-129",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Standards Council of Canada",
          "Label_French_TXT": "Conseil canadien des normes"
        },
        {
          "Value_TXT": "org-130",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "The Federal Bridge Corporation Limited",
          "Label_French_TXT": "La Soci\u00E9t\u00E9 des ponts f\u00E9d\u00E9raux Limit\u00E9e"
        },
        {
          "Value_TXT": "org-131",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "The Jacques-Cartier and Champlain Bridges Inc.",
          "Label_French_TXT": "Les Ponts Jacques-Cartier et Champlain Inc."
        },
        {
          "Value_TXT": "org-132",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "VIA Rail Canada Inc.",
          "Label_French_TXT": "VIA Rail Canada Inc."
        },
        {
          "Value_TXT": "org-133",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Windsor-Detroit Bridge Authority",
          "Label_French_TXT": "Autorit\u00E9 du pont Windsor-D\u00E9troit"
        },
        {
          "Value_TXT": "org-134",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Canada Development Investment Corporation",
          "Label_French_TXT": "Corporation d\u0027investissements au d\u00E9veloppement du Canada"
        },
        {
          "Value_TXT": "org-135",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Royal Canadian Mint",
          "Label_French_TXT": "Monnaie royale canadienne"
        }
      ]
    },
    {
      "FieldDefinitionId": 7,
      "Field_Name_TXT": "security_classification",
      "Sort_Order_NUM": 170,
      "Name_English_TXT": "Security Categorization",
      "Name_French_TXT": "Classification de s\u00E9curit\u00E9\u00A0",
      "English_DESC": "Select the appropriated security categorization.",
      "French_DESC": "S\u00E9lectionnez la cat\u00E9gorisation de s\u00E9curit\u00E9 appropri\u00E9e.",
      "Required_FLAG": true,
      "MultiSelect_FLAG": false,
      "Validators_TXT": null,
      "Custom_Field_FLAG": false,
      "Default_Value_TXT": "0",
      "CascadeParentId": null,
      "Choices": [
        {
          "Value_TXT": "0",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Unclassified",
          "Label_French_TXT": "Non-classifi\u00E9"
        }
      ]
    },
    {
      "FieldDefinitionId": 8,
      "Field_Name_TXT": "subject",
      "Sort_Order_NUM": 180,
      "Name_English_TXT": "Subject",
      "Name_French_TXT": "Sujet",
      "English_DESC": "The topic of the content of the dataset. You may select or deselect multiple subjects.",
      "French_DESC": "Le sujet du contenu du jeu de donn\u00E9es. Vous pouvez s\u00E9lectionner ou d\u00E9s\u00E9lectionner de multiples sujets.",
      "Required_FLAG": true,
      "MultiSelect_FLAG": true,
      "Validators_TXT": "",
      "Custom_Field_FLAG": false,
      "Default_Value_TXT": null,
      "CascadeParentId": null,
      "Choices": [
        {
          "Value_TXT": "arts_music_literature",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Arts, Music, Literature",
          "Label_French_TXT": "Arts, musique, litt\u00E9rature"
        },
        {
          "Value_TXT": "agriculture",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Agriculture",
          "Label_French_TXT": "Agriculture"
        },
        {
          "Value_TXT": "economics_and_industry",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Economics and Industry",
          "Label_French_TXT": "\u00C9conomie et industrie"
        },
        {
          "Value_TXT": "education_and_training",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Education and Training",
          "Label_French_TXT": "\u00C9ducation et formation"
        },
        {
          "Value_TXT": "form_descriptors",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Form Descriptors",
          "Label_French_TXT": "Format"
        },
        {
          "Value_TXT": "government_and_politics",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Government and Politics",
          "Label_French_TXT": "Gouvernement et vie politique"
        },
        {
          "Value_TXT": "health_and_safety",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Health and Safety",
          "Label_French_TXT": "Sant\u00E9 et s\u00E9curit\u00E9"
        },
        {
          "Value_TXT": "history_and_archaeology",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "History and Archaeology",
          "Label_French_TXT": "Histoire et arch\u00E9ologie"
        },
        {
          "Value_TXT": "information_and_communications",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Information and Communications",
          "Label_French_TXT": "Information et communication"
        },
        {
          "Value_TXT": "labour",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Labour",
          "Label_French_TXT": "Travail et emploi"
        },
        {
          "Value_TXT": "language_and_linguistics",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Language and Linguistics",
          "Label_French_TXT": "Langue et linguistique"
        },
        {
          "Value_TXT": "law",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Law",
          "Label_French_TXT": "Droit"
        },
        {
          "Value_TXT": "military",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Military",
          "Label_French_TXT": "Histoire et science militaire"
        },
        {
          "Value_TXT": "nature_and_environment",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Nature and Environment",
          "Label_French_TXT": "Nature et environnement"
        },
        {
          "Value_TXT": "persons",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Persons",
          "Label_French_TXT": "Personnes"
        },
        {
          "Value_TXT": "processes",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Processes",
          "Label_French_TXT": "Liens et fonctions"
        },
        {
          "Value_TXT": "society_and_culture",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Society and Culture",
          "Label_French_TXT": "Soci\u00E9t\u00E9 et culture"
        },
        {
          "Value_TXT": "science_and_technology",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Science and Technology",
          "Label_French_TXT": "Sciences et technologie"
        },
        {
          "Value_TXT": "transport",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Transport",
          "Label_French_TXT": "Transport"
        }
      ]
    },
    {
      "FieldDefinitionId": 9,
      "Field_Name_TXT": "keywords_en",
      "Sort_Order_NUM": 190,
      "Name_English_TXT": "Keywords (English)",
      "Name_French_TXT": "Mots cl\u00E9s (anglais)",
      "English_DESC": "Commonly used words or phrases which describe the dataset, in English. (Separate multiple entries by commas)",
      "French_DESC": "Mots ou phrases couramment utilis\u00E9s qui d\u00E9crivent le jeu de donn\u00E9es, en anglais. (S\u00E9parer les mots ou phrases par une virgule)",
      "Required_FLAG": true,
      "MultiSelect_FLAG": false,
      "Validators_TXT": "fluent_tags",
      "Custom_Field_FLAG": false,
      "Default_Value_TXT": null,
      "CascadeParentId": null,
      "Choices": []
    },
    {
      "FieldDefinitionId": 10,
      "Field_Name_TXT": "keywords_fr",
      "Sort_Order_NUM": 200,
      "Name_English_TXT": "Keywords (French)",
      "Name_French_TXT": "Mots cl\u00E9s (fran\u00E7ais)",
      "English_DESC": "Commonly used words or phrases which describe the dataset, in French. (Separate multiple entries by commas)",
      "French_DESC": "Mots ou phrases couramment utilis\u00E9s qui d\u00E9crivent le jeu de donn\u00E9es, en fran\u00E7ais. (S\u00E9parer les mots ou phrases par une virgule)",
      "Required_FLAG": true,
      "MultiSelect_FLAG": false,
      "Validators_TXT": "fluent_tags",
      "Custom_Field_FLAG": false,
      "Default_Value_TXT": null,
      "CascadeParentId": null,
      "Choices": []
    },
    {
      "FieldDefinitionId": 11,
      "Field_Name_TXT": "access_restrictions",
      "Sort_Order_NUM": 210,
      "Name_English_TXT": "Access Restrictions",
      "Name_French_TXT": "Restrictions d\u0027acc\u00E8s",
      "English_DESC": "The access restrictions of the workspace",
      "French_DESC": "Les restrictions d\u0027acc\u00E8s \u00E0 l\u0027espace de travail",
      "Required_FLAG": true,
      "MultiSelect_FLAG": false,
      "Validators_TXT": "",
      "Custom_Field_FLAG": false,
      "Default_Value_TXT": null,
      "CascadeParentId": null,
      "Choices": [
        {
          "Value_TXT": "unrestricted",
          "Cascading_Value_TXT": null,
          "Label_English_TXT": "Unrestricted",
          "Label_French_TXT": "Non affect\u00E9"
        }
      ]
    },
    {
      "FieldDefinitionId": 12,
      "Field_Name_TXT": "creator",
      "Sort_Order_NUM": 250,
      "Name_English_TXT": "Workspace Lead Name",
      "Name_French_TXT": "Nom du prospect de l\u0027espace de travail",
      "English_DESC": null,
      "French_DESC": null,
      "Required_FLAG": true,
      "MultiSelect_FLAG": false,
      "Validators_TXT": null,
      "Custom_Field_FLAG": false,
      "Default_Value_TXT": null,
      "CascadeParentId": null,
      "Choices": []
    },
    {
      "FieldDefinitionId": 13,
      "Field_Name_TXT": "contact_email",
      "Sort_Order_NUM": 260,
      "Name_English_TXT": "Workspace Lead Email ",
      "Name_French_TXT": "E-mail du responsable de l\u0027espace de travail",
      "English_DESC": null,
      "French_DESC": null,
      "Required_FLAG": true,
      "MultiSelect_FLAG": false,
      "Validators_TXT": null,
      "Custom_Field_FLAG": false,
      "Default_Value_TXT": null,
      "CascadeParentId": null,
      "Choices": []
    }
  ]
}
```