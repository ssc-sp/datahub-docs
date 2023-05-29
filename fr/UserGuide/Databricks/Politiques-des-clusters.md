---
remarks: Automatically translated with DeepL
source: /UserGuide/Databricks/Cluster-Policies.md
draft: true
---

# Politiques des clusters du Federal Science Datahub Databricks

<video width="720" height="405" controls>
    <source src="/api/media/cluster-policies.mp4" type="video/mp4">
    Votre navigateur ne prend pas en charge la balise vidéo.
</video>

## Aperçu

Dans le cadre du Federal Science Datahub, nous fournissons des politiques de cluster Databricks personnalisées qui sont conçues pour vous aider à tirer le meilleur parti de vos clusters Databricks grâce à des configurations de cluster prédéfinies. Nous proposons actuellement 3 politiques de cluster en plus de la politique de calcul personnel de Databrick. Il s'agit de "Datahub Small Cluster", "Datahub Regular Cluster" et "Datahub Large Cluster". Alors que les configurations des travailleurs et des pilotes sont prédéfinies, le choix du [databricks runtime] (https://docs.databricks.com/runtime/index.html) dépend entièrement de vous. Nous allons détailler chacune de ces politiques de cluster ci-dessous.

### **Informatique personnelle**

Il s'agit de la politique de cluster par défaut fournie par Databricks. Elle est conçue pour un usage personnel et n'est pas recommandée pour une utilisation en production. C'est un bon choix si vous commencez à utiliser Databricks et que vous voulez vous familiariser avec son fonctionnement. C'est également un bon choix si vous travaillez avec de petits ensembles de données et que vous n'avez pas besoin d'une grande puissance de calcul. Notez que ce cluster est un cluster à nœud unique/travailleur unique et qu'en tant que tel, aucune parallélisation ne sera effectuée. Par défaut, il utilise le dernier runtime d'apprentissage automatique, ce qui signifie que les outils d'apprentissage automatique sont disponibles dans ce cluster. La configuration du cluster est la suivante :

- **Type de nœud:** Standard_DS3_v2 (4 CPU, 14 GB de mémoire)

[Plus d'informations ici sur les politiques de calcul personnel] (https://docs.databricks.com/clusters/personal-compute.html)

### **Datahub Small Cluster**

Cette politique de cluster est conçue pour les petites charges de travail de production. C'est un bon choix si vous travaillez avec de petits ensembles de données et que vous n'avez pas besoin d'une petite quantité de puissance de calcul qui peut évoluer si nécessaire. C'est également un bon choix si vous débutez avec Databricks et que vous souhaitez vous familiariser avec un cluster non personnel. La configuration du cluster est la suivante :

- **Type de travailleur et de pilote:** Standard_D4ds_v5 (4 CPU, 16 GB de mémoire)
- Nombre de travailleurs:** 0 à 2 travailleurs
- **Capable de faire des instances ponctuelles**
- **Peut faire de l'autoscaling**

### **Datahub Regular Cluster**

Cette politique de cluster est conçue pour des charges de travail de production régulières. C'est un bon choix si vous avez rencontré des goulets d'étranglement avec la configuration en petits clusters. La configuration du cluster est la suivante :

- **Type de travailleur et de conducteur:** Choix parmi les suivants
  - Standard_D4ds_v5 (4 CPU, 16 GB de mémoire)
  - Standard_D8ds_v5 (8 CPU, 32 GB de mémoire)
  - Standard_D16ds_v5 (16 CPU, 64 GB de mémoire)
- Nombre de travailleurs:** 0 à 4 travailleurs
- **Capable de faire des instances ponctuelles**
- **Pouvant être mis à l'échelle**

### **Datahub Large Cluster**

Cette politique de cluster est conçue pour les charges de travail de production importantes. C'est un bon choix si vous travaillez avec des données extrêmement volumineuses qui nécessitent une parallélisation maximale. Il n'est pas recommandé aux utilisateurs d'utiliser ce cluster s'ils ne sont pas conscients des coûts qu'il peut entraîner. La configuration du cluster est la suivante :

- **Type de travailleur et de conducteur:** Choix parmi les suivants
  - Standard_D4ds_v5 (4 CPU, 16 GB de mémoire)
  - Standard_D8ds_v5 (8 CPU, 32 GB de mémoire)
  - Standard_D16ds_v5 (16 CPU, 64 GB de mémoire)
  - Standard_D32ds_v5 (32 CPU, 128 GB de mémoire)
  - Standard_D48ds_v5 (48 CPU, 192 GB de mémoire)
  - Standard_D64ds_v5 (64 CPU, 256 GB de mémoire)
- Nombre de travailleurs:** 0 à 4 travailleurs
- **Capable de faire des instances ponctuelles**
- **Pouvant être mis à l'échelle**

## Création d'un cluster

Pour plus d'informations sur la création de clusters, veuillez vous référer à la [documentation Databricks] (https://learn.microsoft.com/en-us/azure/databricks/clusters/configure).

## A l'avenir

Nous étudions déjà la possibilité d'élaborer de nouvelles politiques en matière de clusters qui offriront non seulement des configurations spécifiques, mais aussi des outils spécifiques, tels que le support de Conda. Nous communiquerons avec les utilisateurs lors de la publication de ces nouvelles politiques de cluster.
