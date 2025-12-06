# Hosting a Full-Stack Application
---

In this project you will learn how to take a newly developed Full-Stack application built for a retailer and deploy it to a cloud service provider so that it is available to customers. You will use the AWS console and CLI to start and configure the services the application needs such as a database to store product information and a web server allowing the site to be discovered by potential customers. You will modify your `package.json` scripts and replace hard coded secrets with environment variables in your code.

After the initial setup, you will learn to interact with the services you started on AWS and will deploy the application manually a first time to it. As you get more familiar with the services and interact with them through a CLI, you will gradually understand all the moving parts.

You will then register for a free account on CircleCI and connect your GitHub account to it. Based on the manual steps used to deploy the app, you will write a `config.yml` file that will make the process reproducible in CircleCI. You will set up the process to be executed automatically when code is pushed on the main GitHub branch.

The project also includes writing documentation and runbooks covering the operations of the deployment process. Those runbooks serve as a way to communicate with future developers and anybody involved in diagnosing outages of the Full-Stack application.

# Udagram
---

This application is provided to you as an alternative starter project if you do not wish to host your own code done in the previous courses of this nanodegree. The Udagram application is a fairly simple application that includes all the major components of a Full-Stack web application.

## Deployed Application

### Udagram Front-end

This is the link for the front-end of the Udagram App (static website hosted on S3):

<a href="http://udacityudagram119580582047.s3-website-us-east-1.amazonaws.com/" target="_blank">Udagram</a>

### Udagram Back-end (API)

The back-end API is deployed on AWS Elastic Beanstalk:

```text
http://udagram-env.eba-prm6ap2v.us-east-1.elasticbeanstalk.com/api/v0
```

---

## Infrastructure

**Cloud services used:**

- **AWS RDS (PostgreSQL)**
    - Stores users and feed items
    - Publicly accessible with SSL required

- **AWS Elastic Beanstalk (Node.js)**
    - Hosts the back-end API (`udagram-api`)
    - Environment variables are configured in the EB environment (via console or `eb setenv`)

- **AWS S3**
    - One bucket for:
        - Hosting the front-end build (`udagram-frontend`)
        - Storing image files uploaded via signed URLs (media bucket `udacityudagram119580582047`)
    - CORS is configured on the bucket to allow the front-end to access uploaded images.

- **CircleCI**
    - Used for the CI/CD pipeline:
        - Install & test
        - Build front-end
        - Deploy API to Elastic Beanstalk
        - Upload front-end build to S3

For more details check [Infrastructure Doc.](/documentation/Infrastructure.md)

---

## Pipeline

### Process Diagram

![This is an image](/Screenshots/Pipeline-Diagram.JPG)

For more details check [Pipeline Process Doc.](/documentation/Pipeline-process.md)

### Dependencies

What modules is our app depending on?

- Back-end: Node.js, Express, Sequelize, pg, AWS SDK, etc.
- Front-end: Angular, RxJS, etc.

For more details check [Dependencies Doc.](/documentation/App-dependencies.md)

---

## Installation (Local Development)

> These steps are for running the application **locally** using the same AWS RDS and S3 resources.

### 1. Provision AWS resources

1. In AWS, provision a publicly available **RDS PostgreSQL** database.
2. In AWS, provision an **S3 bucket** for hosting uploaded files (media bucket).
3. Provision an **Elastic Beanstalk** environment for the API (for deployment), and an S3 bucket for the front-end (or reuse the same bucket with proper folder structure).

### 2. Environment variables

Create a `.env` file in `udagram-api` (or export these variables in your shell / EB environment):

```env
POSTGRES_HOST=postgres.cmzzljcqh4ji.us-east-1.rds.amazonaws.com
POSTGRES_PORT=5432
POSTGRES_DB=postgres
POSTGRES_USERNAME=postgres
POSTGRES_PASSWORD=<your_db_password>

AWS_REGION=us-east-1
AWS_PROFILE=default
AWS_BUCKET=udacityudagram119580582047

JWT_SECRET=<your_jwt_secret>
PORT=8080
URL=http://localhost:8080
```

> The RDS instance requires SSL. Sequelize is configured with `dialectOptions.ssl.require = true` and `rejectUnauthorized = false`, so you **do not** need to set `NODE_TLS_REJECT_UNAUTHORIZED=0` anymore.

### 3. Back-end setup (`udagram-api`)

From the project root:

```bash
cd udagram-api
npm install

# compile TypeScript
npm run tsc

# run the API locally
npm start
```

The API will be available at:

```text
http://localhost:8080/api/v0
```

### 4. Front-end setup (`udagram-frontend`)

In a **new terminal**, from the project root:

```bash
cd udagram-frontend
npm install
```

For development:

```bash
# Angular 8 + webpack on Node 16+ may require this flag:
NODE_OPTIONS=--openssl-legacy-provider npm start
```

The front-end will be available at:

```text
http://localhost:4200
```

Make sure the front-end environment config points to your local or EB API:

`src/environments/environment.ts`:

```ts
export const environment = {
  production: false,
  apiHost: 'http://localhost:8080/api/v0'
};
```

For production build (used for S3 hosting):

```bash
NODE_OPTIONS=--openssl-legacy-provider npm run build
```

Then upload the build to S3:

```bash
aws s3 cp --recursive ./dist/udagram-frontend/ s3://udacityudagram119580582047
```

---

## Testing

This project contains a test suite for the front-end (unit & e2e).

1. `cd udagram-frontend`
2. `npm run test`
3. `npm run e2e`

> There are no unit tests on the back-end in this project.

### Unit Tests:

Unit tests are using the **Jasmine** framework.

### End to End Tests:

The e2e tests use **Protractor** and **Jasmine**.

---

## Built With

- [Angular](https://angular.io/) - Single Page Application Framework
- [Node](https://nodejs.org) - JavaScript Runtime
- [Express](https://expressjs.com/) - JavaScript API Framework
- [PostgreSQL](https://www.postgresql.org/) - Relational Database
- [AWS](https://aws.amazon.com/) - Cloud Infrastructure (RDS, S3, Elastic Beanstalk)

---

## License

[License](LICENSE.txt)
