## BYO Storage from AWS

### Step 1
Create an S3 Bucket and set the following bucket policy.


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

### Step 2
Create an AIM user and assign a policy that would allow it to access the previous bucket. I've tested adding the user to a group to which I added the **AmazonS3FullAccess** permission policy. I am sure there are better ways to do this.

### Step 4

Create an **Access key** for the user and save Key and Secret. 

```
Access Key: ###########
Key Secret: ##################
```

### Step 5

Configure the BYO AWS Storage in Datahub providing the **Access Key**, **Access Key Secret**, **Bucket AWSRegion** and **Bucket Name**.
