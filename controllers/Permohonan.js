import Permohonan from "../models/PermohonanModel.js";
import { Op } from "sequelize";

export const getPermohonan = async (req, res) => {
  const page = parseInt(req.query.page) || 0;
  const limit = parseInt(req.query.limit) || 10;
  const search = req.query.search_query || "";
  const offset = limit * page;
  const totalRows = await Permohonan.count({
    attributes: [
      "id",
      "id_permohonan",
      "suratdkId",
      "nik",
      "pemohon",
      "surat",
      "wa",
      "aktif",
    ],
    where: {
      [Op.or]: [
        {
          nik: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          pemohon: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          surat: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          wa: {
            [Op.like]: "%" + search + "%",
          },
        },
      ],
    },
  });
  const totalPage = Math.ceil(totalRows / limit);
  const result = await Permohonan.findAll({
    attributes: [
      "id",
      "id_permohonan",
      "suratdkId",
      "nik",
      "pemohon",
      "surat",
      "wa",
      "aktif",
    ],
    where: {
      [Op.or]: [
        {
          nik: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          pemohon: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          surat: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          wa: {
            [Op.like]: "%" + search + "%",
          },
        },
      ],
    },
    offset: offset,
    limit: limit,
    order: [["id", "DESC"]],
  });

  res.json({
    result: result,
    page: page,
    limit: limit,
    totalRows: totalRows,
    totalPage: totalPage,
  });
};

export const getPermohonanById = async (req, res) => {
  try {
    const response = await Permohonan.findOne({
      where: {
        id_permohonan: req.params.id,
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const savePermohonan = async (req, res) => {
  const { nik, pemohon, surat, wa } = req.body;
  try {
    await Permohonan.create({
      nik: nik,
      pemohon: pemohon,
      surat: surat,
      wa: wa,
    });
    res.status(201).json({ msg: "Permohonan berhasil ditambahkan" });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const deletePermohonan = async (req, res) => {
  const permohonan = await Permohonan.findOne({
    where: {
      id_permohonan: req.params.id,
    },
  });
  if (!permohonan)
    return res.status(404).json({ msg: "Permohonan tidak ditemukan" });
  try {
    await Permohonan.destroy({
      where: {
        id: permohonan.id,
      },
    });
    res.status(200).json({ msg: "Permohonan berhasil dihapus" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};

export const updateAktif = async (req, res) => {
  try {
    const { id } = req.body;
    const data = await Permohonan.findOne({
      where: { id_permohonan: req.params.id },
    });
    const aktif = data.aktif;
    const newAktif = aktif === 1 ? 0 : 1;
    await Permohonan.update(
      { aktif: newAktif },
      { where: { id_permohonan: req.params.id } }
    );
    res.status(200).json({
      success: true,
      message: `Nilai kolom aktif untuk data dengan id ${id} telah diupdate menjadi ${newAktif}.`,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: "Terjadi kesalahan saat memproses permintaan.",
      error: error.message,
    });
  }
};
