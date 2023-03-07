---
remarks: Automatically translated with DeepL
source: /AdminGuide/Datahub-Artifacts-Naming-Standards.md
draft: true
---

# Noms des projets

Le nom du projet doit être discuté avec le client lors de l'accueil. Un nom long doit être descriptif et une abréviation courte doit comporter 5 caractères maximum.

**Echantillon:** _Citations et mentions sociales_ - **CASM**

## Artéfacts mondiaux

Les artefacts mondiaux sont censés être partagés entre plusieurs secteurs et projets.

> `GLB_<Projet>`

## Artifacts spécifiques au projet

Préfixe pour les éléments techniques

> `<Secteur>_<Projet>`

**Echantillon:** CFS_CASM_CITATIONS

# Structures de dossiers

Les dossiers et autres artefacts qui ne sont pas soumis à des restrictions de longueur devraient utiliser le secteur, le projet et la description longue.

**Échantillon:** Projet CFS_Citations et mentions sociales

# Normes de dénomination des artefacts Azure

## Comptes de stockage

<service>-<secteur>-<projet>

**Echantillon:** databricks-cfs-casm

## Comptes internes

<service>-CIOSB-Datahub

## Tagging

Tous les artefacts Azure devraient au moins être étiquetés avec les balises distinctes suivantes :
- Secteur. Par exemple, étiquette CFS
- Projet, par exemple, étiquette CASM
- Contact technique <tech_first_last> - tech_yask_shelat
- Contact professionnel : <biz_first_last> - biz_francis_lougheed
- Classification de sécurité : ProtégéA, ProtégéB

# Normes d'architecture et de dénomination des lacs du Delta

- Les tables Delta Lake doivent être créées en tant que tables non gérées, en utilisant le compte de stockage basé sur le projet auquel elles sont associées.


- L'architecture des médaillons Or, Argent, Bronze sera utilisée pour différencier la qualité et l'état des données lorsqu'elles sont gérées par les pipelines de données :
![delta_lake_layers.JPG](/.attachments/delta_lake_layers-8312e164-d7a9-4289-a191-fb93925f91de.JPG)



    **Bronze:** la zone d'atterrissage initiale pour les données. Les données sont stockées dans un état aussi proche que possible de leur forme brute, afin de pouvoir rejouer facilement l'ensemble du pipeline depuis le début, si nécessaire.

    **Argent:** les données brutes sont nettoyées, transformées et potentiellement enrichies par des ensembles de données externes.

   **Gold:** données de qualité production sur lesquelles les utilisateurs finaux peuvent compter pour la business intelligence, les statistiques descriptives et la science des données / l'apprentissage automatique. Les tables créées dans cette couche doivent respecter les normes de dénomination spécifiées dans la section "Normes de dénomination des données" ci-dessous.



<br>



## Databricks



#### Espace de travail
Le contrôle d'accès à l'espace de travail doit être activé pour empêcher les utilisateurs de voir les objets de l'espace de travail auxquels ils n'ont pas accès.

Les contrôles d'accès aux clusters et aux tables doivent être activés pour garantir que l'accès aux tables peut être fourni aux utilisateurs en fonction des exigences de sécurité.

Chaque projet peut avoir jusqu'à deux groupes de sécurité associés à lui :

1. Write-Access-Group - Utilisé pour empêcher les utilisateurs de modifier involontairement des ressources (données, carnets) dont ils ne sont pas responsables.

2. Groupe d'accès en lecture (facultatif) - ce groupe doit être utilisé selon les besoins lorsqu'il est nécessaire de contrôler l'accès en lecture aux données/dossiers/notebooks.

La convention de dénomination à suivre pour les deux groupes de sécurité est la suivante :
<acronyme du projet>-Write-Access
<Acronyme du projet>-Read-Access

Exemple :
CITSM-Write-Access
CITSM-Read-Access

### Contrôle d'accès aux dossiers et aux ordinateurs portables
Les privilèges **Editer, Gérer, Exécuter** pour les dossiers et les carnets de notes doivent être limités aux utilisateurs qui appartiennent au groupe d'accès d'écriture de ce projet.

Par défaut, tous les utilisateurs doivent pouvoir visualiser les dossiers et les carnets de notes. Si, dans le cadre d'un projet, il est nécessaire de contrôler qui peut voir les contenus tels que les carnets de notes et les données, il faut utiliser le groupe Read-Access-Group pour répondre à cette exigence.



### Clusters Databricks

Il est recommandé d'avoir deux clusters, un cluster ETL et un cluster BI pour chaque projet.

Ces étiquettes seront utilisées pour garantir la convergence du suivi de l'utilisation et des coûts au niveau du projet, du secteur ou de la branche pour chaque groupe, quel que soit son type.


1. Cluster pour gérer le pipeline de données - ETL Cluster
- À utiliser par les ingénieurs de données pour construire les pipelines de données nécessaires à la création de ressources de données prêtes à l'emploi.


2. Cluster pour accéder aux données prêtes pour la production à partir du delta lake - BI Cluster
- À utiliser par les utilisateurs finaux qui accéderont aux données à l'aide d'outils de BI tels que Power BI et Tableau.

- Le cluster BI doit être configuré pour permettre l'accès aux données en utilisant [SQL uniquement] (https://docs.databricks.com/security/access-control/table-acls/table-acl.html#sql-only-table-access-control).


La convention de dénomination à suivre pour le cluster est la suivante : Cluster-<acronyme du projet>-<type de cluster (bi|etl>>>

Exemple : cluster-citsm-bi


Chaque groupe doit avoir les étiquettes suivantes attachées :
Secteur
Branche
Projet
Type de cluster:<bi>ou<etl>

### Contrôle de l'accès aux données

Le groupe de sécurité Write-Access-Group sera utilisé pour contrôler quels utilisateurs doivent avoir la capacité d'écrire et de mettre à jour les données appartenant à un projet spécifique.

Tous les utilisateurs de datahub auront un accès en lecture aux données par défaut. S'il y a une exigence spécifique au projet pour contrôler qui peut voir les données, Read-Access-Group pour ce projet doit être utilisé pour contrôler l'accès.



###Secrets
Les informations sensibles telles que les mots de passe et les clés API doivent être gérées à l'aide d'Azure Vault et référencées comme "secrets" dans les carnets.



## Normes de dénomination des bases de données

1. Tableaux
2. Colonnes
3. Propriétés des colonnes

    1. Type de données
    2. Taille des données
    3. Valeurs par défaut
4. Propriétés d'intégrité référentielle

1. Contraintes d'intégrité

    1. Clé primaire
    2. Contrainte unique (clé alternative)
    3. Clé étrangère
    4. Contrôler les contraintes

1. Suivez les normes de dénomination des objets décrites dans (x.x) pour nommer les tables, les colonnes, les contraintes et autres constructions dans la création des objets du schéma de la base de données.

1. Utilisez le trait de soulignement (\_) pour séparer les termes du nom.

# Normes de dénomination des objets de la base de données

Voici une liste de directives à utiliser pour nommer les objets de la base de données :

Mots en minuscules Les mots en minuscules représentent une variable et doivent être remplacés par l'information spécifique.

| (barre verticale) | indique un OU à l'intérieur des accolades ou des parenthèses. Ne sélectionnez qu'une seule option.

\&lt ; \&gt ; \&lt ; \&gt ; indique les informations requises

[] (parenthèses) [] indique un élément facultatif. Vous pouvez le coder ou l'ignorer.

\_ (trait de soulignement) \_ est un caractère fixe qui doit être utilisé pour séparer les mots afin de faciliter la lecture.

## Schéma

Un schéma est un conteneur/propriétaire logique et un espace de noms pour un ensemble d'objets de base de données, tels que des tables, des index, des vues, etc.

| **Format:** | **\&lt;prefix\&gt;\_\&lt;name\&gt;** | |
| --- | --- |
| **Où:** | **préfixe** : _abréviation de deux à trois caractères pour l'environnement de stockage des données_.
_&lt;liste des abréviations à déterminer&gt;_.

> **nom** : _nom descriptif ou abréviation significative du schéma_.
> **Longueur maximale:** 16

## Table

Les tables seront nommées de manière à ce que les développeurs puissent facilement déterminer quel type de données est stocké dans la table et à quel environnement elle appartient.

| **Format 1 : **** Format 2 : **|** &lt;prefix&gt ; _&lt;name&gt ; **** &lt;prefix&gt;_&lt;name&gt;_&lt;suffix&gt;**
**Note:** _Le format 2 ne s'applique qu'aux tables de faits et de dimensions.
| --- | --- |
| **Where:** | **prefixe** **:** _l'abréviation de l'application ou du domaine d'activité ou de la matière à laquelle le tableau appartient. La plupart du temps, les abréviations comportent de un à cinq caractères.
**name** **:** _est un nom descriptif pour la table_.
_ **suffixe** _ **:** _l'abréviation du type de table_ _ **&lt;types de table à déterminer&gt;** _ |.
| **Longueur maximale:** | _24_ |

**Règles:**

Le nom de la table doit par défaut être formé à partir de l'entité du modèle de données qu'elle représente, conformément aux conventions d'appellation énoncées ci-dessus.

Les noms des tables **vont** :

- être sans ambiguïté dans son champ d'application

- reflètent le véritable contenu/usage du tableau

- être singulier
- utiliser des abréviations non ambiguës et communément comprises (à énumérer en annexe)
- ne doit pas comporter plus de 24 caractères, y compris les préfixes et les suffixes.

Les noms de table **ne seront pas** :

- utiliser des abréviations ambiguës ou difficiles à déchiffrer
- décrire de manière inexacte le contenu ou l'utilisation de la table
- contiennent des descriptions superflues telles que &#39;table&#39 ; ou &#39;fichier&#39 ; ou &#39;données&#39 ;

## Colonne

Les colonnes seront nommées de manière à ce que les développeurs puissent facilement déterminer l'utilisation et éventuellement le type des données stockées.

| | **Format 1:** | **\&lt;name\&gt;\_\&lt;class\_word\&gt;**
 |
| --- | --- |
| **Où:** | **Nom** **:** _doit être significatif et décrire pour son but ou son contenu_.
**class\_word** : _mot de classe qui indique le type de données stockées dans la colonne. Veuillez vous référer à la section Mot de classe ci-dessous pour la liste.
 |
| **Longueur maximale:** | _30_ |
| **Exemple:** | _AREA\_ID __ORDER\_DATE__ ACTIVE\_FLAG_
 |

**Règles:**

Les noms des colonnes **vont** :

- être sans ambiguïté dans son tableau
- reflètent le véritable contenu/usage de la colonne
- être singulier
- utiliser des abréviations non ambiguës et communément comprises (fournir une liste en annexe) si des abréviations sont nécessaires
- ne doit pas comporter plus de 30 caractères, y compris les préfixes et les suffixes.
- être unique au sein d'un ensemble de tableaux d'une application

Les noms de colonnes **ne seront pas** :

- utiliser des abréviations ambiguës ou difficiles à déchiffrer
- décrire de manière inexacte le contenu ou l'utilisation de la colonne
- ne pas inclure un mnémonique de table ou d'application, sauf si le nom de la colonne est un mot réservé

La taille de la colonne **sera** :

- être au moins de la même taille (ou plus grande) que les colonnes du système source mais pas nécessairement du même type

Un mot de classe décrit la classification principale des données associées à un élément de données. Un mot de classe est attribué à tous les attributs et à toutes les colonnes. Le mot de classe est utilisé pour classifier l'objectif de l'attribut ou de la colonne.

| Mot de la classe | Abréviation | Définition
| --- | --- | --- |
| L'attribut Montant est une mesure numérique de la valeur monétaire. Un attribut de montant peut être spécifié comme un nombre entier, peut inclure des positions décimales et peut avoir une valeur positive ou négative. Par exemple, 23 943,00 $, 99 $, -14,00 $. |
| --- | --- | --- |
| Montant (utilisé dans la vue des devises uniquement) | AMTL | Une mesure numérique de la valeur monétaire exprimée en devise locale. |
| Le montant est une mesure numérique de la valeur monétaire exprimée dans une devise de rapport. |
| Un code est un ensemble d'une ou plusieurs valeurs définies par l'utilisateur qui représentent un élément d'information plus significatif et descriptif de l'entreprise. Un code représente généralement un ensemble statique de valeurs. Par exemple, &quot;C01&quot ; peut être la valeur codée pour la description&quot;Année civile 2000 - Période 1&quot ;.
**Un code peut être associé à une description, un nom ou rien du tout (dans les cas où le code a un sens).**
| Un nombre entier qui représente la valeur comptée pour un événement commercial, calculé de manière programmatique par un compteur. |
| La date est le jour, le mois ou l'année, quelle qu'en soit la combinaison. Elle comprend les jours civils (MMJJAAA, AAAAMMJJ) et les dates fiscales. |
| Description | DESC | Un mot ou une phrase qui interprète un, code. Par exemple, &quot;Calendar Year 2000 - Period 1&quot ; est la description de la valeur codée &quot;C01&quot ;. |
| La durée est un champ numérique qui représente le temps (supérieur aux heures et aux minutes) pendant lequel quelque chose existe ou dure. |
| URL| URL| URL standard |
| Courriel | EMAIL | Adresse électronique unique |
| Notes | NT | Texte long pour les notes |
| Champ numérique exprimant un nombre réel autre qu'une valeur en pourcentage. Par exemple, PRODUCT COST GROSSUP FACTOR peut contenir la valeur numérique utilisée pour calculer un coût de produit majoré. |
| Identification / Identificateur | ID | Une étiquette unique. Les identifiants peuvent souvent être classés en tant qu'identifiants commerciaux ou de substitution. Un identifiant commercial est un identifiant couramment utilisé par une unité commerciale. Par exemple, un numéro de série utilisé pour identifier une pièce d'EQUIPEMENT. Les identificateurs commerciaux peuvent avoir une certaine intelligence. Les identificateurs de substitution n'ont généralement pas de signification ou d'intelligence ; ils fournissent simplement une clé unique. |
| Indicateur | FLAG | Un code qui n'a que 2 valeurs de domaine : Y ou N. |
| Le multiplicateur est une valeur entière qui peut prendre l'une des trois valeurs suivantes : -1, 0, 1 : -Les multiplicateurs sont utilisés pour dériver d'autres valeurs. |
| Nom | NAME | Valeur de caractère utilisée pour identifier ou décrire un objet ou un concept d'entreprise. Il s'agit généralement d'un nom ou d'un titre descriptif couramment utilisé. Il s'agit souvent d'un nom propre, par exemple, NOM DU SERVICE, NOM DU CLIENT. Le mot-classe NOM peut être associé à un code s&#8217il est jugé plus significatif. |
| Une valeur qui n'a pas pour but de mesurer une quantité ou d'exprimer un pourcentage ou un facteur, mais qui est généralement une valeur numérique. Des caractères non numériques peuvent être contenus dans la valeur, comme dans NUMÉRO D'ACTIVITÉ. Pour cette raison, les attributs comportant ce mot de classe ne sont normalement pas soumis à l'arithmétique. |
| Pourcentage (Percentage) | PCT | Champ numérique exprimant un pourcentage. Par exemple, l'attribut POURCENTAGE DE VENTES RÉDUITES peut contenir le pourcentage utilisé pour réduire le prix d'un produit. |
| Quantité | QTY | Un nombre entier qui représente la valeur comptée pour un événement commercial ou un autre objet. Par exemple, QUANTITÉ TOTALE DE L'INVENTAIRE. |
| Une quantité, un montant ou un degré de quelque chose mesuré par unité de quelque chose d'autre. Un montant de paiement ou de charge basé sur un autre montant ; _par exemple_ le montant de la prime par unité d'assurance. |
| Ratio | RTO | Le quotient indiqué de deux expressions mathématiques. Le rapport en quantité, en montant ou en taille entre deux ou plusieurs choses. |
| Surrogate Key | SID | Un identifiant unique qui n'a pas de signification ou d'intelligence. Le SID est utilisé pour les identifiants uniques des dimensions de la marte. |
| Texte | TXT | Description en texte libre ou non structuré. Le texte, contrairement au nom et à la description, n'a pas de but spécifique prédéfini. |
| La valeur binaire de 0 ou 1 à utiliser comme indicateur.
| Un point dans le temps ou une mesure exprimée en termes d'heure, de minute, de seconde ou de fraction de celle-ci dans n'importe quelle combinaison. (HH:MM:SS, HHMM, HH, etc.) Cela ne comprend pas les heures mesurées en tant que quantité, comme le nombre d'heures nécessaires pour remplir un bon de commande. |
| L'horodatage est une valeur de date et d'heure générée par le système qui est utilisée pour enregistrer un événement système. L'horodatage est souvent utilisé à des fins d'audit. |
| Valeur | VAL | Une valeur numérique qui peut être utilisée dans un calcul arithmétique. |

## Autre convention d'appellation pour les ressources Azure

Suffixe d'environnement :
- dev = Dev
- tst = Test
- prd = Production


| Ressource Azure | Convention (env)| Exemple |
| --- | --- | --- |
| App Insight pour App Service | dh-portal-insight-app-<i>env</i> | dh-portal-insight-app-<i>dev</i>||.
| App Service pour l'application portail | dh-portal-app-<i>env</i> | dh-portal-app-<i>dev</i> |
| Compte Cosmos DB|dh-portal-cosmosdb-<i>env</i>|dh-portal-cosmosdb-<i>dev</i>|.
| App de fonction pour PowerShell | dh-portal-function-ps-<i>env</i>|dh-portal-function-ps-<i>dev</i>|
| Key Vault | datahub-key-<i>env</i>|datahub-key-<i>dev</i>|
| Espace de travail d'analyse de logs | dh-portal-log-<i>env</i>|dh-portal-log-<i>dev</i>||.
| SQL Server | dh-portal-sql-<i>env</i>|dh-portal-sql-<i>dev</i>||.
| Base de données SQL | dh-portal-<i>database_name</i>|dh-portal-<i>projectdb</i>|.
| Recherche | dh-portal-search-<i>env</i>|dh-portal-search-<i>dev</i>|.
| Service SignalR | dh-portal-signalr-<i>env</i>|dh-portal-signalr-<i>dev</i>||.
| Storage Gen 2 | dhportaldatalake<i>env</i>|dhportaldatalake<i>dev</i>|
| Compte de stockage | dhportalstorage<i>env</i>|dhportalstorage<i>dev</i>|.

# Power BI

## Noms des espaces de travail

Les espaces de travail Power BI sont censés être partagés entre plusieurs utilisateurs et/ou groupes.

> `<branch_name> - <project_acronym> - <project_description``.

**Echantillon:** _HRB_ _-_ _HRWF_ _-_ _Workforce_

**Règles:**
- Évitez d'ajouter des numéros de version dans le nom
- Évitez d'ajouter des références à une date (par exemple, année, mois, jour).
