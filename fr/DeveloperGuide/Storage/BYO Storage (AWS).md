---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Storage/BYO_Storage_(AWS).md
draft: true
---

## Stockage BYO à partir d'AWS

### Étape 1
Créez un S3 Bucket et définissez la politique suivante pour le Bucket.


```
{
    "Version" : "2012-10-17",
    "Déclaration" : [
        {
            "Effet" : "Autoriser",
            "Principal" : "*",
            "Action" : [
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObject",
                "s3:ListBucket"
            ],
            "Ressource" : [
                "arn:aws:s3:::<nom-de-votre-bucket>/*",
                "arn:aws:s3:::<votre-nom-de-bucket>"
            ]
        }
    ]
}
```

### Étape 2
Créez un utilisateur AIM et attribuez-lui une politique qui lui permette d'accéder au seau précédent. J'ai essayé d'ajouter l'utilisateur à un groupe auquel j'ai ajouté la politique d'autorisation **AmazonS3FullAccess**. Je suis sûr qu'il y a de meilleures façons de procéder.

### Étape 4

Créez une **clé d'accès** pour l'utilisateur et enregistrez la clé et le secret.

```
Clé d'accès : ###########
Secret de polichinelle : ##################
```

### Étape 5

Configurez le BYO AWS Storage dans Datahub en fournissant les **Clé d'accès**, **Secret de la clé d'accès**, **Bucket AWSRegion** et **Nom du Bucket**.
