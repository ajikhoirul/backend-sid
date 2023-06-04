import Galeri from "../models/GaleriModel.js";
import path from "path";
import Users from "../models/UserModel.js";
import fs from "fs";

export const getGaleri = async (req, res) => {
  try {
    const response = await Galeri.findAll({
      include: [
        {
          model: Users,
          attributes: ["name"],
        },
      ],
    });
    res.json(response);
  } catch (error) {
    console.log(error.message);
  }
};

export const getGaleriById = async (req, res) => {
  try {
    const response = await Galeri.findOne({
      where: {
        id_galeri: req.params.id,
      },
      include: [
        {
          model: Users,
          attributes: ["name"],
        },
      ],
    });
    res.json(response);
  } catch (error) {
    console.log(error.message);
  }
};

export const saveGaleri = (req, res) => {
  if (req.files === null)
    return res.status(400).json({ msg: "Gambar tidak terupload" });
  const { judul } = req.body;
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
      await Galeri.create({
        judul: judul,
        gambar: fileName,
        url: url,
        userId: req.userId,
      });
      res.status(201).json({ msg: "Galeri berhasil ditambahkan" });
    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  });
};
export const updateGaleri = async (req, res) => {
  const galeri = await Galeri.findOne({
    where: {
      id_galeri: req.params.id,
    },
  });
  if (!galeri) return res.status(404).json({ msg: "Galeri tidak ditemukan" });
  let fileName = "";
  if (req.files === null) {
    fileName = galeri.gambar;
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

    const filepath = `./public/images/${galeri.gambar}`;
    fs.unlinkSync(filepath);
    file.mv(`./public/images/${fileName}`, (err) => {
      if (err) return res.status(500).json({ msg: err.message });
    });
  }
  const { judul } = req.body;
  const url = `${req.protocol}://${req.get("host")}/images/${fileName}`;
  try {
    await Galeri.update(
      {
        judul: judul,
        gambar: fileName,
        url: url,
        userId: req.userId,
      },
      {
        where: {
          id_galeri: req.params.id,
        },
      }
    );
    res.status(200).json({ msg: "Galeri berhasil diupdate" });
  } catch (error) {
    console.log(error.message);
  }
};
export const deleteGaleri = (req, res) => {};
