import SuratTidakMampu from "../models/SuratTidakMampuModel.js";
import { Op } from "sequelize";
import Permohonan from "../models/PermohonanModel.js";

export const getSuratTidakMampu = async (req, res) => {
  const page = parseInt(req.query.page) || 0;
  const limit = parseInt(req.query.limit) || 10;
  const search = req.query.search_query || "";
  const offset = limit * page;
  const totalRows = await SuratTidakMampu.count({
    where: {
      [Op.or]: [
        {
          pemohon: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          n_bapak: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          n_ibu: {
            [Op.like]: "%" + search + "%",
          },
        },
      ],
    },
  });
  const totalPage = Math.ceil(totalRows / limit);
  const result = await SuratTidakMampu.findAll({
    where: {
      [Op.or]: [
        {
          pemohon: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          n_bapak: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          n_ibu: {
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

export const getSuratTidakMampuById = async (req, res) => {
  try {
    const response = await SuratTidakMampu.findOne({
      where: {
        id_surat_tidak_mampu: req.params.id,
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const createSuratTidakMampu = async (req, res) => {
  const {
    pemohon,
    n_bapak,
    nik_bapak,
    t_bapak,
    pekerjaan_bapak,
    agama_bapak,
    alamat_bapak,
    n_ibu,
    nik_ibu,
    t_ibu,
    pekerjaan_ibu,
    agama_ibu,
    alamat_ibu,
    keperluan,
    nik,
    surat,
    wa,
  } = req.body;
  try {
    const SuratTdk = await SuratTidakMampu.create({
      pemohon: pemohon,
      n_bapak: n_bapak,
      nik_bapak: nik_bapak,
      t_bapak: t_bapak,
      pekerjaan_bapak: pekerjaan_bapak,
      agama_bapak: agama_bapak,
      alamat_bapak: alamat_bapak,
      n_ibu: n_ibu,
      nik_ibu: nik_ibu,
      t_ibu: t_ibu,
      pekerjaan_ibu: pekerjaan_ibu,
      agama_ibu: agama_ibu,
      alamat_ibu: alamat_ibu,
      keperluan: keperluan,
    });

    const suratTdkId = SuratTdk.id_surat_tidak_mampu;

    await Permohonan.create({
      nik: nik,
      pemohon: pemohon,
      surat: surat,
      wa: wa,
      suratdkId: suratTdkId,
    });
    res
      .status(201)
      .json({ msg: "Surat keterangan tidak mampu berhasil ditambahkan" });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const deleteSuratTidakMampu = async (req, res) => {
  const suratTidakMampu = await SuratTidakMampu.findOne({
    where: {
      id_surat_tidak_mampu: req.params.id,
    },
  });
  if (!suratTidakMampu)
    return res.status(404).json({ msg: "Surat tidak ditemukan" });
  try {
    await SuratTidakMampu.destroy({
      where: {
        id: suratTidakMampu.id,
      },
    });
    res.status(200).json({ msg: "Surat berhasil dihapus" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};

export const updateAktif = async (req, res) => {
  try {
    const { id } = req.body;
    const data = await SuratTidakMampu.findOne({
      where: { id_surat_tidak_mampu: req.params.id },
    });
    const aktif = data.aktif;
    const newAktif = aktif === 1 ? 0 : 1;
    await SuratTidakMampu.update(
      { aktif: newAktif },
      { where: { id_surat_tidak_mampu: req.params.id } }
    );
    await Permohonan.update(
      { aktif: newAktif },
      { where: { suratdkId: req.params.id } }
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

export const getCountSuratTdk = async (req, res) => {
  try {
    const count = await SuratTidakMampu.count({
      where: {
        aktif: 0,
      },
    });
    res.status(200).json(count);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};
