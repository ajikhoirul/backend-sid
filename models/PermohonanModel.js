import { Sequelize } from "sequelize";
import db from "../config/Database.js";
import SuratTidakMampu from "./SuratTidakMampuModel.js";

const { DataTypes } = Sequelize;

const Permohonan = db.define(
  "permohonan",
  {
    id_permohonan: {
      type: DataTypes.STRING,
      defaultValue: DataTypes.UUIDV4,
      allowNull: false,
      validate: {
        notEmpty: true,
      },
    },
    suratdkId: {
      type: DataTypes.INTEGER,
      allowNull: true,
    },
    nik: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notEmpty: true,
      },
    },
    pemohon: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notEmpty: true,
      },
    },
    surat: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notEmpty: true,
      },
    },
    aktif: {
      type: DataTypes.NUMBER,
      allowNull: true,
      defaultValue: 0,
      validate: {
        notEmpty: true,
      },
    },
    wa: {
      type: DataTypes.STRING,
      allowNull: false,
      validate: {
        notEmpty: true,
      },
    },
  },
  {
    freezeTableName: true,
  }
);
SuratTidakMampu.hasMany(Permohonan);
Permohonan.belongsTo(SuratTidakMampu, { foreignKey: "suratdkId" });

export default Permohonan;
