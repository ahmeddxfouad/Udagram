import { Sequelize } from "sequelize-typescript";
import { config } from "./config/config";


export const sequelize = new Sequelize({
  database: config.database,
  username: config.username,
  password: config.password,
  port: config.dbPort,
  
    host: config.host,
    dialect: "postgres",
    storage: ":memory:",
 
});

//const sequelize = new Sequelize('postgres://user:pass@example.com:5432/dbname')
/*
export const sequelize = new Sequelize(
  "postgres://postgres:postgres@udagram.cbzajvgfyfkf.us-east-1.rds.amazonaws.com:5432/udagram"
);
*/


/*
// Option 3: Passing parameters separately (other dialects)
const sequelize = new Sequelize('database', 'username', 'password', {
  host: 'localhost',
  dialect: // one of 'mysql' | 'mariadb' | 'postgres' | 'mssql' 
});
*/