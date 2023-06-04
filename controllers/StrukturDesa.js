import StrukturDesa from "../models/StrukturDesaModel.js";
import path from "path";
import fs from "fs";

export const getStrukturDesa = async (req, res) => {
  try {
    const response = await StrukturDesa.findAll();
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const getStrukturDesaById = async (req, res) => {
  try {
    const response = await StrukturDesa.findOne({
      where: {
        id_struktur: req.params.id,
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const saveStrukturDesa = async (req, res) => {
  if (req.files === null)
    return res.status(400).json({ msg: "Gambar tidak terupload" });
  const { text } = req.body;
  const file = req.files.file;
  const fileSize = file.data.length;
  const ext = path.extname(file.name);
  const fileName = `${file.md5}-${Date.now()}${ext}`;
  const url = `${req.protocol}://${req.get("host")}/images/${fileName}`;
  const allowedType = [".png", ".jpg", ".jpeg"];

  if (!allowedType.includes(ext.toLowerCase()))
    return res.status(422).json({ msg: "Format gambar tidak valid" });
  if (fileSize > 5000000)
    return res.status(422).json({ msg: "Gambar tidak boleh daripada 5MB" });
  file.mv(`./public/images/${fileName}`, async (err) => {
    if (err) return res.status(500).json({ msg: err.message });
    try {
      await StrukturDesa.create({
        text: text,
        gambar: fileName,
        url: url,
      });
      res.status(201).json({ msg: "Struktur Desa berhasil ditambahkan" });
    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  });
};
export const updateStrukturDesa = async (req, res) => {
  const strukturDesa = await StrukturDesa.findOne({
    where: {
      id_struktur: req.params.id,
    },
  });
  if (!strukturDesa)
    return res.status(404).json({ msg: "Struktur Desa tidak ditemukan" });
  let fileName = "";
  if (req.files === null) {
    fileName = strukturDesa.gambar;
  } else {
    const file = req.files.file;
    const fileSize = file.data.length;
    const ext = path.extname(file.name);
    fileName = `${file.md5}-${Date.now()}${ext}`;
    const allowedType = [".png", ".jpg", ".jpeg"];

    if (!allowedType.includes(ext.toLowerCase()))
      return res.status(422).json({ msg: "Format gambar tidak valid" });
    if (fileSize > 5000000)
      return res.status(422).json({ msg: "Gambar tidak boleh daripada 5MB" });

    const filepath = `./public/images/${strukturDesa.gambar}`;
    fs.unlinkSync(filepath);
    file.mv(`./public/images/${fileName}`, (err) => {
      if (err) return res.status(500).json({ msg: err.message });
    });
  }
  const { text } = req.body;
  const url = `${req.protocol}://${req.get("host")}/images/${fileName}`;
  try {
    await StrukturDesa.update(
      {
        text: text,
        gambar: fileName,
        url: url,
      },
      {
        where: {
          id_struktur: req.params.id,
        },
      }
    );
    res.status(200).json({ msg: "Struktur Desa berhasil diupdate" });
  } catch (error) {
    console.log(error.message);
  }
};
export const deleteStrukturDesa = (req, res) => {};
