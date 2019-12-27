# analytics-engine-batch
refer to https://github.com/nicolas2lee/streaming-ibmcloud-workshop

https://developer.ibm.com/clouddataservices/docs/analytics-engine/
## Prerequisite
[Analytics engine best practices](https://cloud.ibm.com/docs/AnalyticsEngine?topic=AnalyticsEngine-best-practices&locale=ja)

### Provision necessary ibm cloud resource
* Cloud object storage
* Analytics engine
    * if create instance by web console, add this part in Advanced configuration to set default cos storage
    
    
        {
            "core-site": {
                "fs.cos.firstbucket.v2.signer.type": false, 
                "fs.cos.firstbucket.access.ke": "<access-key>", 
                "fs.cos.firstbucket.secret.key": "<secret-key>",
                "fs.cos.firstbucket.endpoint": "s3.eu.cloud-object.storage.appdomain.cloud"
            }
        } 
        
* IBM Watson Studio
* Cassandra
#### Using Terraform & ibm cloud cli plugin

## Data
Using kaggle data
### Install kaggle client cli
    
    pip install kaggle

### Set credential for kaggle account

profile -> account -> create new api token

Change the right for credential file

    chmod 600 ~/.kaggle/kaggle.json
    
[kaggle client cli](https://github.com/Kaggle/kaggle-api)

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

./bin/spark-submit \
  --class org.apache.spark.examples.SparkPi \
  --master local[8] \
  /Users/xinrui/tao/software/spark-2.4.3-bin-hadoop2.7/examples/jars/spark-examples_2.11-2.4.3.jar \
  100

./bin/spark-submit \
  --class tao.SparkPi \
  --master local[8] \
  /Users/xinrui/tao/ibmcloud_projects/streaming-scala-demo/spark-object-storage-demo-scala/target/spark-object-storage-demo-scala-1.0-SNAPSHOT.jar \
  100   
  
./bin/spark-submit \
  --class tao.Application \
  --master local[8] \
  --files /Users/xinrui/tao/ibmcloud_projects/streaming-scala-demo/spark-object-storage-demo-scala/src/main/resources/log4j-spark.properties \
  --conf "spark.driver.extraJavaOptions=-Dlog4j.configuration=log4j-spark.properties" \
  --conf "spark.executor.extraJavaOptions=-Dlog4j.configuration=log4j-spark.properties" \
  /Users/xinrui/tao/ibmcloud_projects/streaming-scala-demo/spark-object-storage-demo-scala/target/spark-object-storage-demo-scala-1.0-SNAPSHOT.jar \
  100   
  
