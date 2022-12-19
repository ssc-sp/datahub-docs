## Introduction

This is a quick overview of setting up an environment to be able to contribute to the Datahub project

## Prerequisites

- [.NET Core SDK 6.0.x](https://dotnet.microsoft.com/en-us/download/dotnet/6.0)
- [Powershell](https://github.com/powershell/powershell#readme)

One of:

- [Visual Studio](https://visualstudio.microsoft.com/downloads/)
- [JetBrains Rider](https://www.jetbrains.com/rider/)
  - Note: In order to use JetBrians Rider, a License is required. A student license can be obtained with a student email for free.

## Getting Started

### Visual Studio

Clone the repository:

![clone](https://raw.githubusercontent.com/wiki/ssc-sp/datahub-portal/static/vs/clone.png)

Populate `Repository location` with the Datahub's repository link: `https://github.com/ssc-sp/datahub-portal.git` and select a path to the parent directory which will contain the repository.

![repo](https://raw.githubusercontent.com/wiki/ssc-sp/datahub-portal/static/vs/repo.png)

TENTATIVE: In order to configure the build parameters correctly, send a request to the project owner, or alternatively **if you're an SSC Intern**, send a request to `matteo.gisondi@ssc-spc.gc.ca` for the appropriate `appsettings` schema.

Copy the schema to the `Datahub.Portal` directory.

Select the appropriate schema in the top bar, and hit run/debug to launch the application in the browser.

![schema](https://raw.githubusercontent.com/wiki/ssc-sp/datahub-portal/static/vs/schema.png)

If prompted, trust SSL Certificate:

![ssl cert](https://raw.githubusercontent.com/wiki/ssc-sp/datahub-portal/static/vs/ssl_cert.png)

and select yes on the security warning:

![security warning](https://raw.githubusercontent.com/wiki/ssc-sp/datahub-portal/static/vs/security_warning.png)

### JetBrains Rider

Initialize a new project:

![new project](https://raw.githubusercontent.com/wiki/ssc-sp/datahub-portal/static/rider/new.png)

Populate `URL` with the Datahub's repository link: `https://github.com/ssc-sp/datahub-portal.git` and select a path to the parent directory which will contain the repository. If `git` is not installed, click `Download and Install`; If the installation fails, acquire `git` from [https://git-scm.com/downloads](https://git-scm.com/downloads).

![vc](https://raw.githubusercontent.com/wiki/ssc-sp/datahub-portal/static/rider/vc.png)

Once cloned, if prompted select `Trust and Open`.

![trust](https://raw.githubusercontent.com/wiki/ssc-sp/datahub-portal/static/rider/trust.png)

TENTATIVE: In order to configure the build parameters correctly, send a request to the project owner, or alternatively **if you're an SSC Intern**, send a request to `matteo.gisondi@ssc-spc.gc.ca` for the appropriate `appsettings` schema.

Copy the schema to the `Datahub.Portal` directory.

Select the appropriate schema in the top bar, and hit run/debug to launch the application in the browser.

![run](https://raw.githubusercontent.com/wiki/ssc-sp/datahub-portal/static/rider/run.png)
