import Test from "../models/TestingModel.js";
import path from "path";

export const getTest = async (req, res) => {
  try {
    const response = await Test.findAll();
    res.json(response);
  } catch (error) {
    console.log(error.message);
  }
};

export const getTestById = async (req, res) => {
  try {
    const response = await Test.findOne({
      where: {
        id: req.params.id,
      },
    });
    res.json(response);
  } catch (error) {
    console.log(error.message);
  }
};

export const saveTest = (req, res) => {
  if (req.files === null)
    return res.status(400).json({ msg: "Tidak ada file yang terupload" });
  const name = req.body.title;
  const file = req.files.file;
  const fileSize = file.data.length;
  const ext = path.extname(file.name);
  const fileName = file.md5 + ext;
  const url = `${req.protocol}://${req.get("host")}/images/${fileName}`;
  const allowedType = [".png", ".jpg", ".jpeg"];

  if (!allowedType.includes(ext.toLowerCase()))
    return res.status(422).json({ msg: "Format gambar tidak valid" });
  if (fileSize > 5000000)
    return res.status(422).json({ msg: "Gambar harus kurang dari 5MB" });

  file.mv(`./public/images/${fileName}`, async (err) => {
    if (err) return res.status(500).json({ msg: err.message });
    try {
      await Test.create({ name: name, image: fileName, url: url });
      res.status(201).json({ msg: "Test berhasil disimpan" });
    } catch (error) {
      console.log(error.message);
    }
  });
};
export const updateTest = (req, res) => {};
export const deleteTest = (req, res) => {};
