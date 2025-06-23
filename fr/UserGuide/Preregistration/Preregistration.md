# Inscription (environnement de preuve de concept)

Il vous guidera dans le processus d'enregistrement et de configuration de votre compte pour la Plateforme fédérale de données scientifiques (PFDS) dans l'environnement de preuve de concept (PdC).

> **Remarque :** L'auto-inscription n'est disponible que dans l'environnement PdC. Dans l'environnement de production, vous devez utiliser le [Portail des services d'hébergement du GC](https://hosting-services-hebergement.canada.ca/s/gc-cloud-fa-catalogue) pour créer un espace de travail ou être ajouté à un espace de travail existant.

## Enregistrement du compte

![Page d'inscription](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/registration-page.png?raw=true)
*Vue de la page d'enregistrement

1. En utilisant un navigateur moderne (Edge ou Chrome), accédez à la page d'inscription de la DHSF à l'adresse [https://federal-science-datahub.canada.ca/register](https://federal-science-datahub.canada.ca/register).

1. Saisissez votre adresse électronique du gouvernement du Canada pour vous inscrire.

1. Lisez les conditions générales et cochez la case pour les accepter.

1. Cliquez sur le bouton **Enregistrer**.

> Note : Si vous êtes déjà enregistré, vous pouvez cliquer sur le lien **Login instead** pour naviguer vers la page de connexion.


## Configuration du compte

![Page de connexion](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/login-page.png?raw=true)
*Vue de la page de connexion



1. Si vous avez un compte PFDS, cliquez sur le bouton **Login** pour être redirigé vers la page de connexion de votre département.
    > Note : Si vous n'êtes pas inscrit, vous pouvez cliquer sur le lien **Inscrire à la place** pour accéder à la page d'inscription.

1. Sélectionnez votre compte du gouvernement du Canada pour vous connecter.
    ![Choisissez un compte](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/pick-an-account.png?raw=true)

1. Lisez et acceptez les permissions requises par l'application DHSF dans notre locataire Azure `163Oxygen`.
    ![Permissions](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/permissions.png?raw=true)

1. Attendez l'apparition de l'invite suivante.
    ![Juste un instant](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/wait-for-prompt.png?raw=true)

1. Cliquez sur `Suivant`
    ![Plus d'informations requises](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/click-next.png?raw=true)

1. Saisissez votre adresse électronique du gouvernement du Canada et votre mot de passe M365/Teams.
    > Note : Certaines organisations utilisent votre mot de passe réseau comme mot de passe M365/Teams. En cas de doute, veuillez contacter votre service informatique.
    ![Saisie du mot de passe](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/password-entry.png?raw=true)

## Authentification multifactorielle

### Configurer l'application Microsoft Authenticator

> Note : Si vous n'utilisez pas l'application Microsoft Authenticator, vous pouvez sauter cette section pour configurer d'autres méthodes de vérification de votre compte.

1. Cliquez sur "Suivant" pour continuer.
    ![AMF Suivant](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/mfa-01.png?raw=true)

1. Cliquez sur "Suivant" pour continuer.
    ![AMF Suivant](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/mfa-02.png?raw=true)

1. Scannez le code QR avec l'application Microsoft Authenticator.
    ![Code QR de balayage de l'AMF](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/mfa-03.png?raw=true)

1. Vérifier l'invite dans l'application Microsoft Authenticator.
    ![Invite de vérification de l'AMF](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/mfa-04.png?raw=true)

1. Cliquez sur "Suivant" pour continuer.
    ![AMF Suivant](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/mfa-05.png?raw=true)

1. Cliquez sur "Terminé" pour terminer la configuration de l'authentification multifactorielle.
    ![AMF Terminé](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/mfa-06.png?raw=true)

### (Facultatif) Configurer d'autres méthodes MFA

1. Cliquez sur le lien "Je veux utiliser une autre application d'authentification".
    ![Méthodes alternatives à l'AMF](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/mfa-01.png?raw=true)

1. Sélectionnez la méthode d'AMF que vous préférez et cliquez sur `Suivant`.
    ![Autres méthodes d'AMF](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/mfa-08.png?raw=true)

    > Remarque : cette section traite de la configuration de l'AMF à l'aide d'un numéro de téléphone. Si vous choisissez d'utiliser une autre méthode, veuillez suivre les instructions à l'écran.

1. Saisissez un numéro de téléphone mobile (professionnel ou personnel) qui peut recevoir des messages SMS et cliquez sur `Suivant`.
    ![Entrez le numéro de téléphone](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/mfa-09.png?raw=true)

1. Saisissez le code reçu par SMS au numéro de téléphone indiqué précédemment et cliquez sur "Suivant".
    ![Entrez le code SMS](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/mfa-10.png?raw=true)

1. Confirmez la vérification par SMS et cliquez sur "Suivant".
    ![Confirmer la vérification du SMS](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/mfa-11.png?raw=true)

1. La configuration du MFA par téléphone est terminée. Cliquez sur "Terminé" pour continuer.
    ![Téléphone AMF complet](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/mfa-12.png?raw=true)

## S'inscrire

Une fois que vous avez terminé le processus d'enregistrement et de configuration de l'AMF, vous pouvez vous connecter à l'application DHSF.

1) (Facultatif) Cliquez sur "Oui" pour rester connecté.   
    ![Restez connecté](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/stay-signed-in.png?raw=true)

1. Sélectionnez la langue de votre choix (anglais ou français) dans la liste déroulante et cliquez sur "Sauvegarder".
   
    ![Sélection de la langue](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/language-selection.png?raw=true)

1. Cliquez sur le lien "Termes et conditions" pour consulter les termes et conditions. Cochez la case pour accepter les termes et conditions et cliquez sur "Terminer".
   
    ![Conditions générales](https://github.com/ssc-sp/datahub-docs/blob/next/UserGuide/Preregistration/terms-and-conditions.png?raw=true)

> Note : Il est important de rappeler que la DHSF n'est approuvée que pour les données **non classifiées**.
