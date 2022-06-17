# Application
---

### Dependencies

```
- Node v14.15.1 (LTS).

- npm 6.14.8 (LTS) or more recent, Yarn can work but was not tested for this project.

- Express 4.16.4 (or more recent), Javascript API Framework used for building web applications and APIs.

- pg 8.7.1 (or more recent), Postgres for running DB.

- sequelize 5.21.4 (or more recent), is a modern TypeScript and Node.js ORM for Postgres.

- bcryptjs 2.4.3, Where you will need it for the decryption process.

- Angular package (devkit, cli etc.), It's a single page application framework for the development of the front-end.

- AWS CLI v2, v1 can work but was not tested for this project.

- A RDS database running Postgres.

- A S3 bucket for Static Web Hosting.

- A S3 bucket for the back-end service documents.

- A Elastic Beanstalk the server that we are going to run our App on.

```

## Testing

This project contains two different test suite: unit tests and End-To-End tests(e2e). Follow these steps to run the tests.

1. `cd starter/udagram-frontend`
1. `npm run test`
1. `npm run e2e`

There are no Unit test on the back-end

### Unit Tests:

Unit tests are using the Jasmine Framework.

### End to End Tests:

The e2e tests are using Protractor and Jasmine.

## Built With

- [Angular](https://angular.io/) - Single Page Application Framework
- [Node](https://nodejs.org) - Javascript Runtime
- [Express](https://expressjs.com/) - Javascript API Framework
