# analytics-engine-batch
refer to https://github.com/nicolas2lee/streaming-ibmcloud-workshop

https://developer.ibm.com/clouddataservices/docs/analytics-engine/
## Prerequisite
[Analytics engine best practices](https://cloud.ibm.com/docs/AnalyticsEngine?topic=AnalyticsEngine-best-practices&locale=ja)

### Provision necessary ibm cloud resource
* Cloud object storage
* Analytics engine
* IBM Watson Studio
* Cassandra
#### Using Terraform & ibm cloud cli plugin

## Storage
### Cloud object storage
### How to upload data
#### IBM cloud web console
When > 200 MB, use Aspera
#### Compatible tool
Possible CFT ?
#### Using API
* Java
* NodeJs
* Python
* Cloud object storage s3 API

[Different ways to upload data into cloud object storage](https://cloud.ibm.com/docs/services/cloud-object-storage?topic=cloud-object-storage-upload)
#### Upload file via HDFS (Connected with cos & analytics engine)
Using

## Calculation

### Create user & role
default username: clsadmin

### Using ibmcloud ae plugin

#### Set ae endpoint
ibmcloud ae endpoint https://chs-<changeme>.<region>.ae.appdomain.cloud

#### HDFS operation
    ibmcloud ae file-system --user clsadmin --password <password> ls
    
### Using Hadoop cli
#### connect to master node
    ssh clsadmin@chs-<changeme>.<region>.ae.appdomain.cloud
 

Using access key & secret key
    
    hdfs dfs \
    -Dfs.cos.firstbucket.access.key=<access-key> \
    -Dfs.cos.firstbucket.secret.key=<secret-key> \
    -Dfs.cos.firstbucket.endpoint=s3.eu.cloud-object.storage.appdomain.cloud \
    -ls cos://<bucket-name>.firstbucket/sample_submission.csv
    
Or using api key

    hdfs dfs \
    -Dfs.cos.firstbucket.iam.api.key=<api-key> \
    -Dfs.cos.firstbucket.endpoint=s3.eu.cloud-object.storage.appdomain.cloud \
    -ls cos://<bucket-name>.firstbucket/sample_submission.csv




### Hive job

### Run spark with HDFS (cos)