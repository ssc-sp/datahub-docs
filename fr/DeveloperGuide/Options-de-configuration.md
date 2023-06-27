---
remarks: Automatically translated with DeepL
source: /DeveloperGuide/Configuration-options.md
draft: true
---

# Options de configuration
Il s'agit de paramètres dans appsettings.json, ou configurés dans l'environnement de déploiement, qui sont utilisés par diverses fonctionnalités de DataHub.

## EmailNotification
Ces paramètres sont utilisés par le système de notification par courriel.

- **SmtpHost**, **SmtpPort**, **SmtpUsername**, et **SmtpPassword** : Définissez le serveur SMTP à utiliser pour envoyer les notifications.
- **SenderName** et **SenderAddress** : Le nom d'affichage et l'adresse électronique à partir desquels les notifications seront envoyées.
- **AppDomain** : Le nom de domaine et le port où DataHub est déployé. Ceci est utilisé pour générer les liens utilisés dans les notifications par e-mail.
- **DevTestMode** : Un booléen qui permet de passer en mode développement. En mode développement, les notifications par courriel seront envoyées à l'adresse spécifiée dans **DevTestEmail** au lieu de leurs destinataires originaux, et les destinataires seront ajoutés au corps du courriel.
- **DevTestEmail** : Voir ci-dessus.

## PublicFileSharing
Ces paramètres sont utilisés pour s'intégrer à PowerBI afin de générer le formulaire d'approbation PDF pour OpenData, et pour spécifier le domaine utilisé pour les liens partagés publiquement.

- **OpenDataApprovalPdfBaseUrl** : L'URL de base du formulaire d'approbation PowerBI. Par exemple, https\://app.powerbi.com/groups/[groupId]/rdlreports/[reportId].
- **OpenDataApprovalPdfFormIdParam** : Le paramètre utilisé pour spécifier l'ID du formulaire d'approbation. À ce jour, le rapport utilise le paramètre "rp:p_approval_form_id".
- **PublicFileSharingDomain** : Le domaine utilisé pour les URLs partagées publiquement.
- **OpenDataApproverName** : Le nom de la personne ou de la boîte aux lettres approuvant les demandes de partage de données ouvertes.
- **OpenDataApproverEmail** : Courriel de la personne ou de la boîte aux lettres approuvant les demandes de partage de données ouvertes.

## HttpLogging
Active ou désactive la journalisation des requêtes HTTP à des fins de débogage. Ne doit pas être activé en production.

- **Enabled** : Active la journalisation HTTP lorsqu'elle est vraie.
- **RequestHeaders** et **ResponseHeaders** : Listes séparées par des virgules indiquant quels en-têtes de demande et de réponse doivent être consignés. Il convient d'être prudent, car certains de ces en-têtes peuvent contenir des données potentiellement sensibles. Les en-têtes non listés apparaîtront avec un point d'interrogation dans le journal.

## CKAN
Ces paramètres sont utilisés pour interagir avec l'API CKAN afin de publier des fichiers partagés dans le registre de données ouvert.

- **BaseUrl** : URL de base de l'API. Par exemple : https\://registry-staging.open.canada.ca/fr/api/3/action
- **AuthKey** : Clé d'authentification pour l'API. Trouvez la valeur dans le KeyVault _datahub-key-dev_ dans un secret nommé : _ckan-authentication-key_.
