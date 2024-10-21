# Recommended Web Applications on FSDH

## Application does not start on cloud

- Make sure the application is listening on the right port
  - The docker compose needs to expose the web application on port 80
  - Inside the docker application, ensure that the address listening is "0.0.0.0" and not "127.0.0.1". The loopback adapter will not be captured by docker port redirection.