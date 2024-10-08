# Custom Work Items for issues in Azure DevOps

We use the "issue" work item type as a ticket for user submitted issues and system issues. This requires some customization at the organization level of your Azure DevOps environment. This guide will describe how to adapt the settings to work with an FSDH environment.

## Accessing process configuration

Navigate to your organization:
![image](https://github.com/ssc-sp/datahub-docs/assets/56747050/479b9482-f3c6-48a0-bcbf-71dab496abc4)

Then navigate to your organization settings:
![image](https://github.com/ssc-sp/datahub-docs/assets/56747050/9b95949a-c93f-4360-9854-5578b36544c5)

Select "Process" from the navigation bar:
![image](https://github.com/ssc-sp/datahub-docs/assets/56747050/b3c84233-27a8-40f6-9c8d-ead779077f3f)

## Adding a custom process

Then click "..." on the Agile process to add an inherited process:
![image](https://github.com/ssc-sp/datahub-docs/assets/56747050/5e1de85b-b9b6-44f7-abf8-92d0c8cc70fb)
You will have to give it a title and a description, in our case, we called it `CustomAgile` but the naming should not matter.

## Editing the "Issue" work item

Then select the "Issue" work item:
![image](https://github.com/ssc-sp/datahub-docs/assets/56747050/82cd664c-50af-44a2-95db-a9d225111cd1)

From here, we want to replicate this:
![image](https://github.com/ssc-sp/datahub-docs/assets/56747050/caf7ce53-dec5-4342-a21d-75557b92ef56)

To do so, in the "Planning" section, add the following fields: `Submitted By`, `Email`, `Workspaces`, `Organization`, `Time Zone` and `Preferred Language`, all as Text (single line). You can add fields this way:
![image](https://github.com/ssc-sp/datahub-docs/assets/56747050/67bb6a23-7f23-4541-ae51-4e12bbe24a24)

## Setting as default process or changing existing project process

After you are done, you must set it as default process, create a new project, and/or change existing project process to this new process:

![image](https://github.com/ssc-sp/datahub-docs/assets/56747050/ac71c7d9-08c7-4c86-b6a8-e1f30408759f)

To instead change the process of an existing project, navigate to the process your project currently use (in our case, it is already CustomAgile):

![image](https://github.com/ssc-sp/datahub-docs/assets/56747050/2c1e3843-85db-4ac8-8e69-33ca6d8a60e6)

Navigate to the projects tab:

![image](https://github.com/ssc-sp/datahub-docs/assets/56747050/571a3170-e0bf-4541-990d-24db719f6db4)

Then click on the "..." next to your project name to change process:

![image](https://github.com/ssc-sp/datahub-docs/assets/56747050/881c0c49-dab0-4ee2-95d4-d7f6915412c5)

Then select the target process for your project:

![image](https://github.com/ssc-sp/datahub-docs/assets/56747050/2578d7a9-dedb-4d98-b874-3ad034f78d44)







