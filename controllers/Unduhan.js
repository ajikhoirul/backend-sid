import Unduhan from "../models/UnduhanModel.js";
import path from "path";
import fs from "fs";
import { Op } from "sequelize";

export const getUnduhan = async (req, res) => {
  const page = parseInt(req.query.page) || 0;
  const limit = parseInt(req.query.limit) || 10;
  const search = req.query.search_query || "";
  const offset = limit * page;
  const totalRows = await Unduhan.count({
    where: {
      [Op.or]: [
        {
          nama: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          url: {
            [Op.like]: "%" + search + "%",
          },
        },
      ],
    },
  });
  const totalPage = Math.ceil(totalRows / limit);
  const result = await Unduhan.findAll({
    where: {
      [Op.or]: [
        {
          nama: {
            [Op.like]: "%" + search + "%",
          },
        },
        {
          url: {
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

export const getUnduhanAktif = async (req, res) => {
  try {
    let response;
    response = await Unduhan.findAll({
      attributes: [
        "id",
        "id_unduhan",
        "nama",
        "file",
        "aktif",
        "url",
        "createdAt",
      ],
      where: {
        aktif: 1,
      },
      order: [["id", "DESC"]],
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const getUnduhanById = async (req, res) => {
  try {
    const response = await Unduhan.findOne({
      attributes: [
        "id",
        "id_unduhan",
        "nama",
        "file",
        "aktif",
        "url",
        "createdAt",
      ],
      where: {
        id_unduhan: req.params.id,
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};
export const createUnduhan = (req, res) => {
  if (req.files === null)
    return res.status(400).json({ msg: "File tidak terupload" });
  const { nama } = req.body;
  const file = req.files.file;
  const fileSize = file.data.length;
  const ext = path.extname(file.name);
  const fileName = `${file.md5}-${Date.now()}${ext}`;
  const url = `${req.protocol}://${req.get("host")}/files/${fileName}`;
  const allowedType = [".pdf", ".docx", ".doc"];

  if (!allowedType.includes(ext.toLowerCase()))
    return res.status(422).json({ msg: "Format file tidak valid" });
  if (fileSize > 10000000)
    return res.status(422).json({ msg: "File tidak boleh daripada 10MB" });
  file.mv(`./public/files/${fileName}`, async (err) => {
    if (err) return res.status(500).json({ msg: err.message });
    try {
      await Unduhan.create({
        nama: nama,
        file: fileName,
        url: url,
      });
      res.status(201).json({ msg: "File berhasil ditambahkan" });
    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  });
};

export const updateUnduhan = async (req, res) => {
  const unduhan = await Unduhan.findOne({
    where: {
      id_unduhan: req.params.id,
    },
  });
  if (!unduhan) return res.status(404).json({ msg: "File tidak ditemukan" });
  let fileName = "";
  if (req.files === null) {
    fileName = unduhan.file;
  } else {
    const file = req.files.file;
    const fileSize = file.data.length;
    const ext = path.extname(file.name);
    fileName = `${file.md5}-${Date.now()}${ext}`;
    const allowedType = [".pdf", ".docx", ".doc"];

    if (!allowedType.includes(ext.toLowerCase()))
      return res.status(422).json({ msg: "Format File tidak valid" });
    if (fileSize > 10000000)
      return res.status(422).json({ msg: "File tidak boleh daripada 10MB" });

    const filepath = `./public/files/${unduhan.file}`;
    fs.unlinkSync(filepath);
    file.mv(`./public/files/${fileName}`, (err) => {
      if (err) return res.status(500).json({ msg: err.message });
    });
  }
  const { nama } = req.body;
  const url = `${req.protocol}://${req.get("host")}/files/${fileName}`;
  try {
    await Unduhan.update(
      {
        nama: nama,
        file: fileName,
        url: url,
      },
      {
        where: {
          id_unduhan: req.params.id,
        },
      }
    );
    res.status(200).json({ msg: "File berhasil diupdate" });
  } catch (error) {
    console.log(error.message);
  }
};
export const deleteUnduhan = async (req, res) => {
  const unduhan = await Unduhan.findOne({
    where: {
      id_unduhan: req.params.id,
    },
  });
  if (!unduhan) return res.status(404).json({ msg: "File tidak ditemukan" });
  try {
    const filepath = `./public/files/${unduhan.file}`;
    fs.unlinkSync(filepath);
    await Unduhan.destroy({
      where: {
        id: unduhan.id,
      },
    });
    res.status(200).json({ msg: "File berhasil dihapus" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};

export const updateAktif = async (req, res) => {
  try {
    const { id } = req.body;
    const data = await Unduhan.findOne({
      where: { id_unduhan: req.params.id },
    });
    const aktif = data.aktif;
    const newAktif = aktif === 1 ? 0 : 1;
    await Unduhan.update(
      { aktif: newAktif },
      { where: { id_unduhan: req.params.id } }
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

export const getUnduhanByLimit = async (req, res) => {
  try {
    const response = await Unduhan.findAll({
      where: {
        aktif: 1,
      },
      order: [["createdAt", "DESC"]],
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};
