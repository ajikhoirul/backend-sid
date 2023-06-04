import TentangDesa from "../models/TentangDesaModel.js";
import path from "path";
import fs from "fs";

export const getTentangDesa = async (req, res) => {
  try {
    const response = await TentangDesa.findAll();
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const getTentangDesaById = async (req, res) => {
  try {
    const response = await TentangDesa.findOne({
      where: {
        id_desa: req.params.id,
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const saveTentangDesa = async (req, res) => {
  if (req.files === null)
    return res.status(400).json({ msg: "Gambar tidak terupload" });
  const { tentang } = req.body;
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
      await TentangDesa.create({
        tentang: tentang,
        gambar: fileName,
        url: url,
      });
      res.status(201).json({ msg: "Tentang Desa berhasil ditambahkan" });
    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  });
};
export const updateTentangDesa = async (req, res) => {
  const tentangDesa = await TentangDesa.findOne({
    where: {
      id_desa: req.params.id,
    },
  });
  if (!tentangDesa)
    return res.status(404).json({ msg: "Tentang Desa tidak ditemukan" });
  let fileName = "";
  if (req.files === null) {
    fileName = tentangDesa.gambar;
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

    const filepath = `./public/images/${tentangDesa.gambar}`;
    fs.unlinkSync(filepath);
    file.mv(`./public/images/${fileName}`, (err) => {
      if (err) return res.status(500).json({ msg: err.message });
    });
  }
  const { tentang } = req.body;
  const url = `${req.protocol}://${req.get("host")}/images/${fileName}`;
  try {
    await TentangDesa.update(
      {
        tentang: tentang,
        gambar: fileName,
        url: url,
      },
      {
        where: {
          id_desa: req.params.id,
        },
      }
    );
    res.status(200).json({ msg: "Tentang Desa berhasil diupdate" });
  } catch (error) {
    console.log(error.message);
  }
};
export const deleteTentangDesa = (req, res) => {};
