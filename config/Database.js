import { Sequelize } from "sequelize";

const db = new Sequelize("auth_db", "root", "", {
  host: "localhost",
  dialect: "mysql",
  timezone: "Asia/Jakarta",
});

export default db;
