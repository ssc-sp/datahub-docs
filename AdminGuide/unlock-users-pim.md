# Unlock Users in Azure Active Directory for Datahub Administrative Unit (AU)

User accounts may be disabled from time to time due to inactivity. This procedure outlines how to manually unlock them using PIM (Privileged Identity Management).

## Prerequisite

Your account must have been granted the following roles:
- User Administrator for the AU
- Directory Reader for AAD

## Activate PIM

1. Login to Azure Portal (https://portal.azure.com) and switch to the correct tenant;
2. Find "Privileged Identity Management" and start "Activate just in time";
3. Click on the "Activate" link and specify the time (usually 1 hour). Wait until your PIM has been activated;

## Re-enable Users
4. From Azure Portal, go to "Administrative units" -> Azure Datahub
5. Go to Users and apply filter "Account enabled == No"
6. Re-enable every users

