---
id: xbo2rj4lours7qktd44jgmr
title: BOTO3
desc: ""
updated: 2024-12-15T22:35
created: 1656681548753
---


You use the **AWS SDK for Python (Boto3)** to create, configure, and manage **AWS services**, such as Amazon Elastic Compute Cloud (**Amazon EC2**) and Amazon Simple Storage Service (**Amazon S3**). The SDK provides an **object-oriented API** as well as low-level access to **AWS services**.

Documentation and developers tend to **refer to the AWS SDK for Python as "Boto3,"** and this documentation often does so as well.


SDK Pattern

![[engineering.Cloud.AWS.Simple Storage Service (S3)]]

```{python}

s3 = boto3.resource("s3")
obj = s3.Object(bucket,filename).get()['Body'].read() # gets the file object
from pickle import loads# above is a handle to file w/ pickled data
mod = loads(obj)
```
