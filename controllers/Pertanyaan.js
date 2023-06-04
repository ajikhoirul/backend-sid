import Pertanyaan from "../models/PertanyaanModel.js";
import { Op } from "sequelize";
import path from "path";
import fs from "fs";

export const getPertanyaan = async (req, res) => {
  try {
    const response = await Pertanyaan.findAll({
      attributes: ["id", "id_pertanyaan", "judul", "jawab"],
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }

  // const page = parseInt(req.query.page) || 0;
  // const limit = parseInt(req.query.limit) || 10;
  // const search = req.query.search_query || "";
  // const offset = limit * page;
  // const totalRows = await Fasilitas.count({
  //   where: {
  //     [Op.or]: [
  //       {
  //         nama: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         waktu: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         nominal: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         gambar: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         alamat: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //     ],
  //   },
  // });
  // const totalPage = Math.ceil(totalRows / limit);
  // const result = await Fasilitas.findAll({
  //   where: {
  //     [Op.or]: [
  //       {
  //         nama: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         waktu: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         nominal: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         gambar: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         alamat: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //     ],
  //   },
  //   offset: offset,
  //   limit: limit,
  //   order: [["id", "DESC"]],
  // });

  // res.json({
  //   result: result,
  //   page: page,
  //   limit: limit,
  //   totalRows: totalRows,
  //   totalPage: totalPage,
  // });
};
export const getPertanyaanById = async (req, res) => {
  try {
    const response = await Pertanyaan.findOne({
      attributes: ["id", "id_pertanyaan", "judul", "jawab"],
      where: {
        id_pertanyaan: req.params.id,
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const createPertanyaan = async (req, res) => {
  const { judul, jawab } = req.body;
  try {
    await Pertanyaan.create({
      judul: judul,
      jawab: jawab,
    });
    res.status(201).json({ msg: "Pertanyaan berhasil ditambahkan" });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const updatePertanyaan = async (req, res) => {
  const pertanyaan = await Pertanyaan.findOne({
    where: {
      id_pertanyaan: req.params.id,
    },
  });
  if (!pertanyaan)
    return res.status(404).json({ msg: "Pertanyaan tidak ditemukan" });
  const { judul, jawab } = req.body;
  try {
    await Pertanyaan.update(
      {
        judul: judul,
        jawab: jawab,
      },
      {
        where: {
          id: pertanyaan.id,
        },
      }
    );
    res.status(200).json({ msg: "Pertanyaan berhasil diupdate" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};

export const deletePertanyaan = async (req, res) => {
  const pertanyaan = await Pertanyaan.findOne({
    where: {
      id_pertanyaan: req.params.id,
    },
  });
  if (!pertanyaan)
    return res.status(404).json({ msg: "Pertanyaan tidak ditemukan" });
  try {
    await pertanyaan.destroy({
      where: {
        id: pertanyaan.id,
      },
    });
    res.status(200).json({ msg: "Pertanyaan berhasil dihapus" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};
