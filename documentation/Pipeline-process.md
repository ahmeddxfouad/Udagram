# Pipeline
---
## Circle CI 
CircleCI is a continuous integration and continuous delivery platform that can be used to implement DevOps practices.

### Diagram
![This is an image](/Screenshots/Pipeline-Diagram.JPG)

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

### Last Build
![This is an image](/Screenshots/CircleCI.png)
### Enviroment Variable
![This is an image](/Screenshots/CircleCI-1.png)

