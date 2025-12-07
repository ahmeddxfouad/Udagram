# Infrastructure
---
## AWS 
---
 ### Services
 ```
1. A Elastic Beanstalk the server that we are going to run our App on.

2. A RDS database running Postgres.

3. A S3 bucket for Static Web Hosting and one the back-end service documents.

 ```
### Configuration
#### ElasticBean
---
![This is an image](/Screenshots/Configuration-1.png)   
--- 
![This is an image](/Screenshots/Configurations-2.png)
---
#### RDS
---
![This is an image](/Screenshots/Configurations-3.png)
#### S3 Bucket
---
![This is an image](/Screenshots/Buckets-1.png)
---
![This is an image](/Screenshots/Buckets-2.png)
---
![This is an image](/Screenshots/Buckets-3.png)
---
![This is an image](/Screenshots/Buckets-4.png)

## Architecture Diagram
![This is an image](/Screenshots/Architecture-Diagram.JPG)

## Circle CI Pipeline
---

### Process
The Pipeline process consist of two main stages:
```
* Build :  
    1- Define the base image can run most needed actions with orbs.
    2- Install node and checkout code.
    3- Install Front-End Dependencies.
    4- Install dependencies in the the backend API.
    5- Lint the frontend.
    6- Build the frontend app.
    7- Build the backend API.
* Deploy :
    1- Setup needed for aws, node, elastic beanstalk.
    2- Install Front-End Dependencies.
    3- Front-End Build.
    4- Front-End Deploy.
    5- Install API Dependencies.
    6- API Build
    7- API Deploy.
```
For more details check [Full Pipeline Doc](/documentation/Pipeline-process.md)
