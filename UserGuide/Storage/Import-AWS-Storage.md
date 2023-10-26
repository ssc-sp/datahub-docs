# Importing an Existing AWS S3 Bucket

To import an AWS S3 bucket, you will need to create a user with the appropriate permissions on the bucket, and generate an access key for that user.

1. Using the **Services** menu in the AWS console, navigate to **Security, Identity & Compliance**, and **IAM** under that section.  
![IAM in service menu](import_aws-01.png)

2. In the **Users** section, create a new user.  
![Users section](import_aws-02.png)
![Create user](import_aws-03.png)
![Assign user name](import_aws-04.png)

3. In the **Set permissions** step of user creation, assign an appropriate policy to the user. **AmazonS3FullAccess** will give full rights to the user, but a more restrictive policy such as the example below may be more appropriate for your organization.  
![Assign policy](import_aws-05.png)  
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": "*",
            "Action": [
                "s3:GetObject",
                "s3:PutObject",
                "s3:DeleteObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::<your-bucket-name>/*",
                "arn:aws:s3:::<your-bucket-name>"
            ]
        }
    ]
}
```
After reviewing the information, click **Create user** to complete this step.  
![Review and create](import_aws-06.png)

4. Once the user is created, find it in the Users list and click on the username. In  the **Summary** section, under **Access key 1**, click **Create access key**  
![Find user in list](import_aws-07.png)
![Create access key](import_aws-08.png)

5. Select **Other** as the use case. Optionally, set a description for the key to easily identify it, and click **Create access key**  
![Access key use case](import_aws-09.png)
![Key description](import_aws-10.png)

6. Once the key is created, make sure to copy the **Access key** and **Secret access key**. You will not be able to retrieve the secret key after exiting from this screen and will have to create a new one if you lose it.  
![Access key](import_aws-11.png)

You can now enter this information, along with the bucket name and region, into the configuration dialog in Datahub.  
![AWS configuration dialog](import_aws-12.png)
