# End to End Testing

This document summarized the workflow for automated end to end testing for the Datahub application.

## Objective

The objective of E2E testing is to test the application from the user perspective. The test will be executed from the UI and will simulate the user interaction with the application.

## Authentication

The current authentication of the application is leveraging [MS Identity](https://learn.microsoft.com/en-us/azure/active-directory/develop/v2-app-types#web-apps) with OIDC.


### Authentication steps

> Note: until Keycloak has been integrated, there will be a manual step to login to the application.

1. Run the portal in the background (can use the `dh-portal` script)
1. Configure credientials in the configuration
```json
{
  "BaseUrl": "https://localhost:5001",
  "Headless": "false",
  "SlowMo": "2000",
  "admin_user": "<admin-test-email>",
  "admin_password": "<admin-test-pw>",
  "user_name": "<user-test-email>",
  "password": "<user-test-pw>"
}
```
3. Run the E2E tests


## Future Authentication

The future authentication will be leveraging [Keycloak](https://www.keycloak.org/). The following steps will be required to login to the application:

1. Run the portal in the background (can use the `dh-portal` script)
1. Configure credientials in the configuration
1. Run the E2E tests
