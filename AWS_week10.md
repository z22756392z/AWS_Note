## Serverless

In AWS (Amazon Web Services), "serverless" refers to a cloud computing model where you don't have to provision or manage servers. It doesn't mean there are no servers involved, but rather that the cloud provider (in this case, AWS) automatically manages the infrastructure for you. This allows you to focus more on writing code and building applications, without the need to worry about server provisioning, scaling, and maintenance.

## Relational database service (RDS)

Amazon RDS (Relational Database Service) is a fully managed relational database service offered by AWS. While it's not inherently "serverless" in the sense of serverless compute services like AWS Lambda, it does provide a managed environment for running relational databases, which can be a critical component of serverless architectures.



## Elastic block service (EBS)

allows you to create and attach storage volumes to your Amazon EC2 instances.(Must be in same AZ)

1. **Ephemeral Storage vs. EBS Storage:**
   - When you launch an EC2 instance, it can be associated with both ephemeral storage (instance store) and EBS storage.
   - Ephemeral storage is temporary and is physically attached to the host computer. If the EC2 instance is terminated, the data on ephemeral storage is lost.
2. **EBS Volumes:**
   - EBS volumes, on the other hand, are separate, durable storage volumes that persist independently of the EC2 instance's lifecycle.
   - If your EC2 instance is terminated, the data on the attached EBS volumes will not be lost by default.
3. **Volume Lifecycle:**
   - EBS volumes exist independently of EC2 instances. You can detach an EBS volume from one EC2 instance and attach it to another.
   - You can also take snapshots of EBS volumes, which are point-in-time copies stored in Amazon S3. Snapshots can be used to create new volumes or migrate data across regions.
4. **Data Persistence:**
   - Data stored on EBS volumes is persistent. It remains intact even if the associated EC2 instance is stopped or terminated.
   - It's essential to ensure that your critical data and applications are stored on EBS volumes rather than relying solely on ephemeral storage if you need data persistence.



https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-using-volumes.html

After attach volume to EC2, we can use command to see the result

`lsblk`

`sudo mkfs -t xfs /dev/xvdf`

`mount /dev/xvdf /data`

`cd /data`

`touch {1..10.txt}`

`umount /data`

## Elastic File System (EFS)

is a scalable, fully managed file storage service provided by AWS. Unlike Amazon EBS, which provides block-level storage volumes, Amazon EFS provides a file system interface and can be mounted on multiple Amazon EC2 instances concurrently. 

## EIP

 is a **static IPv4** address designed for dynamic cloud computing.

when you stop and restart an EC2 instance, it might get a new public IP address. If your application relies on a fixed IP address, associating an Elastic IP prevents the IP address from changing.

## IAM

enables you to securely control access to AWS services and resources. IAM allows you to manage users, groups, and permissions within your AWS environment.