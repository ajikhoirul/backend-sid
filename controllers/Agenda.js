import Agenda from "../models/AgendaModel.js";
import { Op } from "sequelize";

export const getAgenda = async (req, res) => {
  // try {
  //   const response = await Agenda.findAll({
  //     attributes: ["id_agenda", "judul", "waktu", "lokasi", "gambar"],
  //   });
  //   res.status(200).json(response);
  // } catch (error) {
  //   res.status(500).json({ msg: error.message });
  // }

  const page = parseInt(req.query.page) || 0;
  const limit = parseInt(req.query.limit) || 10;
  const search = req.query.search_query || "";
  const offset = limit * page;
  const totalRows = await Agenda.count({
    where: {
      [Op.or]: [
        {
          judul: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          waktu: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          lokasi: {
            [Op.like]: "%" + search + "%",
          },
        },
      ],
    },
  });
  const totalPage = Math.ceil(totalRows / limit);
  const result = await Agenda.findAll({
    where: {
      [Op.or]: [
        {
          judul: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          waktu: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          lokasi: {
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
export const getAgendaById = async (req, res) => {
  try {
    const response = await Agenda.findOne({
      attributes: ["id_agenda", "judul", "waktu", "lokasi", "aktif"],
      where: {
        id_agenda: req.params.id,
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};
export const createAgenda = async (req, res) => {
  const { judul, waktu, lokasi, gambar } = req.body;
  try {
    await Agenda.create({
      judul: judul,
      waktu: waktu,
      lokasi: lokasi,
      gambar: gambar,
    });
    res.status(201).json({ msg: "Agenda berhasil ditambahkan" });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};
export const updateAgenda = async (req, res) => {
  const agenda = await Agenda.findOne({
    where: {
      id_agenda: req.params.id,
    },
  });
  if (!agenda) return res.status(404).json({ msg: "Agenda tidak ditemukan" });
  const { judul, waktu, lokasi, gambar } = req.body;
  try {
    await Agenda.update(
      {
        judul: judul,
        waktu: waktu,
        lokasi: lokasi,
        gambar: gambar,
      },
      {
        where: {
          id: agenda.id,
        },
      }
    );
    res.status(200).json({ msg: "Agenda berhasil diupdate" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};
export const deleteAgenda = async (req, res) => {
  const agenda = await Agenda.findOne({
    where: {
      id_agenda: req.params.id,
    },
  });
  if (!agenda) return res.status(404).json({ msg: "Agenda tidak ditemukan" });
  try {
    await Agenda.destroy({
      where: {
        id: agenda.id,
      },
    });
    res.status(200).json({ msg: "Agenda berhasil dihapus" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};

export const getCountAgenda = async (req, res) => {
  try {
    const count = await Agenda.count();
    res.status(200).json(count);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const getAgendaByLimit = async (req, res) => {
  try {
    const response = await Agenda.findAll({
      attributes: ["id_agenda", "judul", "waktu", "lokasi", "aktif"],
      where: {
        aktif: 1,
      },
      limit: 5,
      order: [["createdAt", "DESC"]],
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const updateAktif = async (req, res) => {
  try {
    const { id } = req.body;
    const data = await Agenda.findOne({
      where: { id_agenda: req.params.id },
    });
    const aktif = data.aktif;
    const newAktif = aktif === 1 ? 0 : 1;
    await Agenda.update(
      { aktif: newAktif },
      { where: { id_agenda: req.params.id } }
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
