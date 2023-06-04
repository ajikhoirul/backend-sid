import Artikel from "../models/ArtikelModel.js";
import Users from "../models/UserModel.js";
import path from "path";
import fs from "fs";

export const getArtikel = async (req, res) => {
  try {
    let response;
    // response = await Artikel.findAll({
    //   attributes: [
    //     "id",
    //     "id_artikel",
    //     "judul",
    //     "isi",
    //     "gambar",
    //     "aktif",
    //     "url",
    //     "createdAt",
    //   ],
    //   include: [
    //     {
    //       model: Users,
    //       attributes: ["name", "email"],
    //     },
    //   ],
    //   order: [["id", "DESC"]],
    // });
    if (req.role === "admin") {
      response = await Artikel.findAll({
        attributes: [
          "id",
          "id_artikel",
          "judul",
          "isi",
          "gambar",
          "aktif",
          "url",
          "createdAt",
        ],
        include: [
          {
            model: Users,
            attributes: ["name", "email"],
          },
        ],
        order: [["id", "DESC"]],
      });
    } else {
      response = await Artikel.findAll({
        attributes: [
          "id",
          "id_artikel",
          "judul",
          "isi",
          "gambar",
          "aktif",
          "url",
          "createdAt",
        ],
        where: {
          userId: req.userId,
        },
        include: [
          {
            model: Users,
            attributes: ["name", "email"],
          },
        ],
        order: [["id", "DESC"]],
      });
    }
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const getArtikelAktif = async (req, res) => {
  try {
    let response;
    response = await Artikel.findAll({
      attributes: [
        "id",
        "id_artikel",
        "judul",
        "isi",
        "gambar",
        "aktif",
        "url",
        "createdAt",
      ],
      include: [
        {
          model: Users,
          attributes: ["name", "email"],
        },
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

export const getArtikelById = async (req, res) => {
  try {
    const response = await Artikel.findOne({
      attributes: [
        "id",
        "id_artikel",
        "judul",
        "isi",
        "gambar",
        "aktif",
        "url",
        "createdAt",
      ],
      where: {
        id_artikel: req.params.id,
      },
      include: [
        {
          model: Users,
          attributes: ["name"],
        },
      ],
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};
export const createArtikel = (req, res) => {
  // const { judul, isi, gambar } = req.body;
  // try {
  //   await Artikel.create({
  //     judul: judul,
  //     isi: isi,
  //     gambar: gambar,
  //     userId: req.userId,
  //   });
  //   res.status(201).json({ msg: "Artikel berhasil ditambahkan" });
  // } catch (error) {
  //   res.status(500).json({ msg: error.message });
  // }

  if (req.files === null)
    return res.status(400).json({ msg: "Gambar tidak terupload" });
  const { judul, isi } = req.body;
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
      await Artikel.create({
        judul: judul,
        isi: isi,
        gambar: fileName,
        url: url,
        userId: req.userId,
      });
      res.status(201).json({ msg: "Artikel berhasil ditambahkan" });
    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  });
};

export const updateArtikel = async (req, res) => {
  const artikel = await Artikel.findOne({
    where: {
      id_artikel: req.params.id,
    },
  });
  if (!artikel) return res.status(404).json({ msg: "Artikel tidak ditemukan" });
  let fileName = "";
  if (req.files === null) {
    fileName = artikel.gambar;
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

    const filepath = `./public/images/${artikel.gambar}`;
    fs.unlinkSync(filepath);
    file.mv(`./public/images/${fileName}`, (err) => {
      if (err) return res.status(500).json({ msg: err.message });
    });
  }
  const { judul, isi } = req.body;
  const url = `${req.protocol}://${req.get("host")}/images/${fileName}`;
  try {
    await Artikel.update(
      {
        judul: judul,
        isi: isi,
        gambar: fileName,
        url: url,
        userId: req.userId,
      },
      {
        where: {
          id_artikel: req.params.id,
        },
      }
    );
    res.status(200).json({ msg: "Artikel berhasil diupdate" });
  } catch (error) {
    console.log(error.message);
  }
};
export const deleteArtikel = async (req, res) => {
  const artikel = await Artikel.findOne({
    where: {
      id_artikel: req.params.id,
    },
  });
  if (!artikel) return res.status(404).json({ msg: "Artikel tidak ditemukan" });
  try {
    const filepath = `./public/images/${artikel.gambar}`;
    fs.unlinkSync(filepath);
    await Artikel.destroy({
      where: {
        id: artikel.id,
      },
    });
    res.status(200).json({ msg: "Artikel berhasil dihapus" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};

export const getCountArtikel = async (req, res) => {
  try {
    const count = await Artikel.count();
    res.status(200).json(count);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const getArtikelByLimit = async (req, res) => {
  try {
    let response;
    response = await Artikel.findAll({
      attributes: [
        "id",
        "id_artikel",
        "judul",
        "gambar",
        "url",
        "createdAt",
        "aktif",
      ],
      where: {
        aktif: 1,
      },
      include: [
        {
          model: Users,
          attributes: ["name"],
        },
      ],
      limit: 5,
      order: [["id", "DESC"]],
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

// Handler untuk endpoint API
export const updateAktif = async (req, res) => {
  try {
    // Ambil data dari request body
    const { id } = req.body;

    // Cari data dengan id tertentu dan mengambil nilai kolom aktif saat ini
    const data = await Artikel.findOne({
      where: { id_artikel: req.params.id },
    });
    const aktif = data.aktif;

    // Periksa nilai kolom aktif saat ini dan buat query untuk mengupdate nilainya
    const newAktif = aktif === 1 ? 0 : 1;
    await Artikel.update(
      { aktif: newAktif },
      { where: { id_artikel: req.params.id } }
    );

    // Kirim respons sukses ke client
    res.status(200).json({
      success: true,
      message: `Nilai kolom aktif untuk data dengan id ${id} telah diupdate menjadi ${newAktif}.`,
    });
  } catch (error) {
    // Tangani error dengan mengirim respons error ke client
    res.status(500).json({
      success: false,
      message: "Terjadi kesalahan saat memproses permintaan.",
      error: error.message,
    });
  }
};
