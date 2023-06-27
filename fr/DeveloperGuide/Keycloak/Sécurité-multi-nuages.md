---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Keycloak/Multi-cloud security.md
draft: true
---

# Sécurité multi-cloud

## Aperçu


Voici un diagramme qui montre comment un utilisateur s'authentifie auprès de keycloak et accède ensuite aux différents fournisseurs de services en nuage.

``mermaid``

organigramme

    U(((Utilisateur)))
    K{{Keycloak}}
    cAWS [Centre d'identité AWS]
    cGCP [GCP Workforce Identity Federation]
    cAZ[Azure Active Directory]

    rAWS [Ressources dans AWS]
    rGCP [Ressources dans les PCG]
    rAZ [Ressources dans Azure]

    U -->|Authenticate| K
    K <===>|Brokered| cAZ
    K --->|Fédéré| cAWS
    K --->|Federated| cGCP

    sous-graphe AWS
        cAWS -->|Autoriser| rAWS
    fin

    sous-graphe GCP
        cGCP -->|Autoriser| rGCP
    fin

    sous-graphe Azure
        cAZ -->|Autoriser| rAZ
    fin
```



# Centre d'identité AWS

[AWS IAM] (https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html) est un service qui vous permet de gérer l'accès aux services et ressources AWS en toute sécurité. L'IAM permet de créer et de gérer des utilisateurs et des groupes AWS, et d'utiliser des autorisations pour leur permettre ou leur refuser l'accès aux ressources AWS.

Le centre d'identité IAM prend également en charge un système de gestion des identités interdomaines (SCIM). Voir [Profil SCIM et mise en œuvre de SAML2.0 sur AWS] (https://docs.aws.amazon.com/singlesignon/latest/userguide/scim-profile-saml.html) pour plus d'informations.

Il existe également un mécanisme permettant de gérer le provisionnement automatiquement. Voir [Automatic provisioning] (https://docs.aws.amazon.com/singlesignon/latest/userguide/provision-automatically.html) pour plus d'informations. Il y a quelques considérations à prendre en compte lors de l'utilisation du provisionnement automatique qui sont couvertes dans le lien précédent.

<Pour que la synchronisation SCIM fonctionne, chaque utilisateur doit avoir un prénom, un nom, un nom d'utilisateur et un nom d'affichage spécifiés. Si l'une de ces valeurs est manquante pour un utilisateur, celui-ci ne sera pas provisionné.

> Remarque : Les modifications apportées aux utilisateurs et aux groupes dans votre fournisseur d'identité ne sont reflétées dans le centre d'identité IAM qu'une fois que votre fournisseur d'identité a envoyé ces modifications au centre d'identité IAM.


# Centre d'identité GCP

[GCP IAM] (https://cloud.google.com/iam/docs/overview) est un service qui vous permet de gérer l'accès aux services et ressources GCP en toute sécurité. Grâce à IAM, vous pouvez créer et gérer des utilisateurs et des groupes GCP, et utiliser des permissions pour autoriser ou refuser leur accès aux ressources GCP.

Le centre d'identité GCP prend également en charge un système de gestion des identités interdomaines (SCIM). Voir [Configurer la fédération d'identité de la main-d'œuvre] (https://cloud.google.com/iam/docs/configuring-workforce-identity-federation) pour plus d'informations.

## Qu'est-ce que la fédération d'identité de main-d'œuvre ?

La fédération d'identité des employés vous permet d'utiliser un fournisseur d'identité externe (IdP) pour authentifier et autoriser un groupe d'utilisateurs (employés, partenaires, sous-traitants, etc.) à l'aide d'IAM, afin que les utilisateurs puissent accéder aux services de Google Cloud. Avec la fédération d'identités des employés, vous n'avez pas besoin de synchroniser les identités des utilisateurs de votre IdP existant avec les identités de Google Cloud, comme vous le feriez avec Google Cloud Directory Sync (GCDS) de Cloud Identity.

<La fédération d'identité des travailleurs étend les capacités d'identité de Google Cloud pour prendre en charge l'authentification unique synchrone basée sur les attributs.

> Note : Dans certains IdP, les attributs sont également appelés "claims" ou "assertions".
Après l'authentification de l'utilisateur, les informations reçues de l'IdP sont utilisées pour déterminer l'étendue de l'accès aux ressources de Google Cloud.

Vous pouvez utiliser la fédération d'identité des travailleurs avec n'importe quel IdP qui prend en charge OpenID Connect (OIDC) ou SAML 2.0, comme Azure Active Directory (Azure AD), Active Directory Federation Services (AD FS), Okta, et d'autres.

# Azure Active Directory

[Azure AD] (https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-whatis) est le service de gestion des identités et des accès de Microsoft basé sur le cloud.
