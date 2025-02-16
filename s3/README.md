# AWS S3 management scripts using AWS CLI

## These scripts cover bucket creation, listing, uploading, and security settings.

#  AWS CLI - S3 Management Commands

Create a Bucket

```
aws s3 mb s3://my-bucket-name --region us-east-1

```

To list all buckets

```
aws s3 ls

```
Upload a File to S3

```
aws s3 cp myfile.txt s3://my-bucket-name/

```
Download a File from S3

```
aws s3 cp file://my-bucket-name/myfile.txt

```
Enable Versioning on a Bucket

```
aws s3api put-bucket-versioning --bucket my-bucket-name --versioning-configuration Status=Enabled

```

Enable Bucket Encryption (SSE-S3)

```
aws s3api put-bucket-encryption --bucket my-bucket-name --server-side-encryption-configuration '{"Rules":[{"ApplyServerSideEncryptionByDefault":{"SSEAlgorithm":"AES256"}}]}'

```
