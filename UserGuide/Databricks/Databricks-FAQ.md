## Databricks Frequently Asked Questions

### What are the programming languages supported in Databricks? 

The following languages are supported: Spark SQL, Java, Scala, Python, R and standard SQL. It offers the opportunity for you to select the language that your developers are comfortable with for your project. Furthermore, Databricks provides the capability for developer to use multiple languages in single notebook.

### My team is currently using basic Python/R for data analysis, how easy is it to transition the skills to use Python for Spark (PySpark) and R for Spark (SparkR)? 

Syntax and the methodologies used by PySpark and SparkR are geared towards idea of multiple computers executing the code that you have written, so their syntax differs to some extend from regular Python and R. Therefore, it may require some training to transition the skills to use the Spark version of the languages. Generally speaking, the transition to use PySpark and SparkR are not that complicated.

### My data project is not a complex and does not require the use of Spark or parallel computing power, can I still use the Databricks for this project?

Absolutely, yes. Databricks provides the capability to write your code using regular Python or R language and use pandas, and other popiular libraries. It also provides capabilities to execute your code on single virtual machine (single cluster), with just minimal computing resource required for your project.

### How can I upload my own dataset and use in Databricks? 

You can upload and manage your dataset using the FSDH  Portal. The uploaded data will be stored in in the cloud using the Azure Blog Storage. To access the uploaded file programmatically using Databricks, you will need to obtain the path where the file is stored. The path of your uploaded file can be obtained by going to the portal and…….… Here is a sample code that shows how to access a data that is stored in Blob Storage using python in Databricks:

### Can I create my own Cluster in Databricks? 

No. For the time being, the Clusters that are required for your project will created and configured by the FSDH team based on your requirement. You will be provided with the controls to start and shut down the clusters.

### Is the Databricks environment certified to handle Protected B information? 

No, currently, the Databricks environment supported by the Federal Science DataHub only supports UNCLASSIFIED data.

### Can I access the Databricks environment using locally running Jupyter notebook or IDEs such as PyCharm,VS Code, and Spyder? 

Yes, you can. However, it requires some configuration to be done on the Databricks. Please contact us with your requirements and we will be happy assist you with this.

### How is my data and the source code protected from unauthorized access? 

The FSDH Analytics environments follow the security principle of “Least Privilege”, which means only the minimum set of privileges required to perform the tasks will be granted to the users. Access controls and procedures will be setup to ensure that any source code that is created within your Databricks project can be viewed and executed by only those users that have been authorized to do so. Similarly, any data stored in the Azure Blog Storage account for your project will be managed by using folder level access control to ensure that reading and writing to the files and folders can be done by only those users that have been explicitly granted access to do so.

### Who will be responsible for setting up the Databricks resources (folders, clusters, access groups and users)Blob Storage Account and the Access Controls pertaining to these components? 

Configuration of the Databricks resources and the storage account will be managed by the FSDH team.

### I have an AI/Machine Learning project that I would like to implement using Databricks, how do I get started?

At the moment, we will not be taking on the responsibility of building the ML Models, however, we will be happy to assist you with providing the technical tools and services necessary to achieve your project objective. 
