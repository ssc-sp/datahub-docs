# Gestion des comptes et contrôle d'accès aux espaces de travail  

La gestion des comptes et le contrôle d'accès ainsi que la maintenance continue des espaces de travail relèvent de la responsabilité des départements qui utilisent le DataHub scientifique federal (DHSF). Au sein du département, le rôle de contrôle d'accès, de gestion des comptes et de maintenance continue incombe au responsable de l'espace de travail. Un utilisateur du département qui demande l'accès au portail du DHSF se voit attribuer le rôle de responsable de l'espace de travail et ses responsabilités, et les responsabilités de chaque utilisateur sont détaillées ci-dessous:  

Les rôles et responsabilités des composants de l'espace de travail sont les suivants. 

| Rôle | Rôle Databricks | Rôle de l'application Web | Rôle de stockage | Rôle PostgreSQL |
| --- | --- | --- | --- | --- |
| Responsable de l'espace de travail | Administrateurs <br/> - Accès à l'espace de travail <br/> - Accès SQL Databricks <br/> - Autoriser la création de clusters sans restriction <br/> - allow-instance-pool-create | Configuration de l'accès, ouverture de l'application Web | Parcourir, télécharger, télécharger, générer un jeton | Informations de connexion à la base de données |
| Administrateur | Administrateurs <br/> - Accès à l'espace de travail <br/> - Accès SQL Databricks <br/> - Autoriser la création de clusters sans restriction <br/> - allow-instance-pool-create | Configuration de l'accès, ouverture de l'application Web | Parcourir, télécharger, télécharger, générer un jeton | Informations de connexion à la base de données |
| Collaborateur | Utilisateurs <br /> - Accès à l'espace de travail <br/> - Accès SQL Databricks | Ouvrir l'application Web | Parcourir, télécharger, télécharger | Aucun rôle |
| Invité | Pas d'accès Databricks | Ouvrir l'application Web | Pas d'accès au stockage | Aucun rôle |
| Responsable des données | Utilisateurs <br/> - Accès à l'espace de travail <br/> - Accès SQL Databricks | Ouvrir l'application Web | Parcourir, télécharger, télécharger | Aucun rôle |

Les rôles et responsabilités détaillés sont dans les annexes 1 et 2 des conditions générales.

5.1 Octroi d'un accès et attribution d'un rôle au sein d'un espace de travail 
L'utilisateur se voit attribuer le rôle de responsable de l'espace de travail lorsqu'il demande l'accès au portail FSDG en remplissant la demande via le portail Salesforce. L'utilisateur doit accepter les conditions générales et remplir toutes les obligations en matière de financement et de politique avant que l'accès ne lui soit accordé. Le responsable de l'espace de travail peut ensuite attribuer des rôles supplémentaires en invitant des utilisateurs à l'espace de travail. Les utilisateurs doivent accepter les conditions générales et satisfaire à toutes les politiques et exigences ministérielles associées à leur rôle (par exemple, l'habilitation de sécurité pour la fiabilité). En outre, les utilisateurs doivent disposer d'un compte de courrier électronique valide du gouvernement du Canada. Le responsable de l'espace de travail doit consulter les responsables de la sécurité des TI de son ministère pour s'assurer de la conformité aux exigences de gestion de l'accès établies par la Directive sur la gestion de la sécurité (Directive sur la gestion de la sécurité - Canada.ca - B.2.3.2).  

5.2 Gestion du contrôle d'accès ou du changement de type de compte 

Les départements et, en particulier, le responsable de l'espace de travail sont chargés de notifier tout changement de compte/rôle au sein de l'espace de travail. Si un responsable d'espace de travail n'est plus le responsable de l'espace de travail, il est chargé de désigner un nouveau responsable d'espace de travail. 

Remarque : si le responsable de l'espace de travail abandonne l'espace de travail (quitte l'organisation), tous les rôles au sein de cet espace de travail peuvent soumettre une demande d'assistance à la DHSF pour demander l'affectation d'un nouveau responsable de l'espace de travail.  

En outre, tous les rôles au sein de l'espace de travail sont chargés de notifier le responsable de l'espace de travail dans les cas suivants:

- L'accès n'est plus nécessaire ou requis.   
- L'accès est modifié ou n'est plus nécessaire en raison d'un transfert ou d'une résiliation.  
- Lorsque des privilèges d'accès sont associés à des types de comptes ou si de nouveaux types de comptes sont créés à la suite d'une modification ou d'une mise à jour du système ?  
- Lorsque l'utilisation d'un espace de travail individuel ou le besoin de savoir change.  

Le responsable de l'espace de travail est chargé d'examiner régulièrement les utilisateurs de son espace de travail. Dans le cas où l'accès à l'espace de travail n'est plus nécessaire pour l'utilisateur (cessation d'emploi, changement de projet, de service, etc). Le responsable de l'espace de travail doit: 

- Désactiver l'accès à l'espace de travail de la DHSF dans les deux jours ouvrables. 
- Informer l'équipe DHSF de la résiliation afin que celle-ci puisse mettre fin à l'accès à l'ensemble du système. 
