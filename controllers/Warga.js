import Warga from "../models/WargaModel.js";
import { Op } from "sequelize";

export const getWarga = async (req, res) => {
  const page = parseInt(req.query.page) || 0;
  const limit = parseInt(req.query.limit) || 10;
  const search = req.query.search_query || "";
  const offset = limit * page;
  const totalRows = await Warga.count({
    where: {
      [Op.or]: [
        {
          nama_lengkap: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          nik: {
            [Op.like]: "%" + search + "%",
          },
        },

        {
          kelamin: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          alamat: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          aktif: {
            [Op.like]: "%" + search + "%",
          },
        },
      ],
    },
  });
  const totalPage = Math.ceil(totalRows / limit);
  const result = await Warga.findAll({
    where: {
      [Op.or]: [
        {
          nama_lengkap: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          nik: {
            [Op.like]: "%" + search + "%",
          },
        },

        {
          kelamin: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          alamat: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          aktif: {
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
export const getWargaById = async (req, res) => {
  try {
    const response = await Warga.findOne({
      attributes: [
        "id_warga",
        "nama_lengkap",
        "nik",
        "kelamin",
        "alamat",
        "aktif",
      ],
      where: {
        id_warga: req.params.id,
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};
export const createWarga = async (req, res) => {
  const { nama_lengkap, nik, kelamin, alamat, aktif } = req.body;
  try {
    await Warga.create({
      nama_lengkap: nama_lengkap,
      nik: nik,
      kelamin: kelamin,
      alamat: alamat,
      aktif: aktif,
    });
    res.status(201).json({ msg: "Warga berhasil ditambahkan" });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};
export const updateWarga = async (req, res) => {
  const warga = await Warga.findOne({
    where: {
      id_warga: req.params.id,
    },
  });
  if (!warga) return res.status(404).json({ msg: "Warga tidak ditemukan" });
  const { nama_lengkap, nik, kelamin, alamat, aktif } = req.body;
  try {
    await Warga.update(
      {
        nama_lengkap: nama_lengkap,
        nik: nik,
        kelamin: kelamin,
        alamat: alamat,
        aktif: aktif,
      },
      {
        where: {
          id: warga.id,
        },
      }
    );
    res.status(200).json({ msg: "Warga berhasil diupdate" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};
export const deleteWarga = async (req, res) => {
  const warga = await Warga.findOne({
    where: {
      id_warga: req.params.id,
    },
  });
  if (!warga) return res.status(404).json({ msg: "Warga tidak ditemukan" });
  try {
    await Warga.destroy({
      where: {
        id: warga.id,
      },
    });
    res.status(200).json({ msg: "Warga berhasil dihapus" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};

export const getCountWarga = async (req, res) => {
  try {
    const count = await Warga.count();
    res.status(200).json(count);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const getPemohonByNik = async (req, res) => {
  try {
    const result = await Warga.findOne({
      attributes: ["id_warga", "nama_lengkap", "nik"],
      where: {
        nik: req.params.nik,
      },
    });

    if (result) {
      res.status(200).json(result);
    } else {
      res.status(404).json({ error: "Data not found" });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const getBapakByNik = async (req, res) => {
  try {
    const result = await Warga.findOne({
      attributes: ["id_warga", "nama_lengkap", "nik"],
      where: {
        nik: req.params.nik,
      },
    });

    if (result) {
      res.status(200).json(result);
    } else {
      res.status(404).json({ error: "Data not found" });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

export const getIbuByNik = async (req, res) => {
  try {
    const result = await Warga.findOne({
      attributes: ["id_warga", "nama_lengkap", "nik"],
      where: {
        nik: req.params.nik,
      },
    });

    if (result) {
      res.status(200).json(result);
    } else {
      res.status(404).json({ error: "Data not found" });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};
