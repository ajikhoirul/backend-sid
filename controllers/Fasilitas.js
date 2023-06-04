import Fasilitas from "../models/FasilitasModel.js";
import { Op } from "sequelize";
import path from "path";
import fs from "fs";

export const getFasilitas = async (req, res) => {
  try {
    const response = await Fasilitas.findAll({
      attributes: [
        "id",
        "id_fasilitas",
        "nama",
        "waktu",
        "nominal",
        "gambar",
        "alamat",
        "url",
        "aktif",
        "createdAt",
      ],
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }

  // const page = parseInt(req.query.page) || 0;
  // const limit = parseInt(req.query.limit) || 10;
  // const search = req.query.search_query || "";
  // const offset = limit * page;
  // const totalRows = await Fasilitas.count({
  //   where: {
  //     [Op.or]: [
  //       {
  //         nama: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         waktu: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         nominal: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         gambar: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         alamat: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //     ],
  //   },
  // });
  // const totalPage = Math.ceil(totalRows / limit);
  // const result = await Fasilitas.findAll({
  //   where: {
  //     [Op.or]: [
  //       {
  //         nama: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         waktu: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         nominal: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         gambar: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //       {
  //         alamat: {
  //           [Op.like]: "%" + search + "%",
  //         },
  //       },
  //     ],
  //   },
  //   offset: offset,
  //   limit: limit,
  //   order: [["id", "DESC"]],
  // });

  // res.json({
  //   result: result,
  //   page: page,
  //   limit: limit,
  //   totalRows: totalRows,
  //   totalPage: totalPage,
  // });
};

export const getFasilitasAktif = async (req, res) => {
  try {
    const response = await Fasilitas.findAll({
      attributes: [
        "id",
        "id_fasilitas",
        "nama",
        "waktu",
        "nominal",
        "gambar",
        "alamat",
        "url",
        "aktif",
        "createdAt",
      ],
      where: {
        aktif: 1,
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const getFasilitasById = async (req, res) => {
  try {
    const response = await Fasilitas.findOne({
      attributes: [
        "id_fasilitas",
        "nama",
        "waktu",
        "nominal",
        "gambar",
        "alamat",
        "url",
        "aktif",
        "createdAt",
      ],
      where: {
        id_fasilitas: req.params.id,
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};
export const createFasilitas = (req, res) => {
  // const { nama, waktu, nominal, gambar, alamat } = req.body;
  // try {
  //   await Fasilitas.create({
  //     nama: nama,
  //     waktu: waktu,
  //     nominal: nominal,
  //     gambar: gambar,
  //     alamat: alamat,
  //   });
  //   res.status(201).json({ msg: "Fasilitas berhasil ditambahkan" });
  // } catch (error) {
  //   res.status(500).json({ msg: error.message });
  // }

  if (req.files === null)
    return res.status(400).json({ msg: "Gambar tidak terupload" });
  const { nama, waktu, nominal, alamat } = req.body;
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
      await Fasilitas.create({
        nama: nama,
        waktu: waktu,
        nominal: nominal,
        gambar: fileName,
        alamat: alamat,
        url: url,
      });
      res.status(201).json({ msg: "Fasilitas berhasil ditambahkan" });
    } catch (error) {
      res.status(500).json({ msg: error.message });
    }
  });
};

export const updateFasilitas = async (req, res) => {
  // const fasilitas = await Fasilitas.findOne({
  //   where: {
  //     id_fasilitas: req.params.id,
  //   },
  // });
  // if (!fasilitas)
  //   return res.status(404).json({ msg: "Fasilitas tidak ditemukan" });
  // const { nama, waktu, nominal, gambar, alamat } = req.body;
  // try {
  //   await Fasilitas.update(
  //     {
  //       nama: nama,
  //       waktu: waktu,
  //       nominal: nominal,
  //       gambar: gambar,
  //       alamat: alamat,
  //     },
  //     {
  //       where: {
  //         id: fasilitas.id,
  //       },
  //     }
  //   );
  //   res.status(200).json({ msg: "Fasilitas berhasil diupdate" });
  // } catch (error) {
  //   res.status(400).json({ msg: error.message });
  // }

  const fasilitas = await Fasilitas.findOne({
    where: {
      id_fasilitas: req.params.id,
    },
  });
  if (!fasilitas)
    return res.status(404).json({ msg: "Fasilitas tidak ditemukan" });
  let fileName = "";
  if (req.files === null) {
    fileName = fasilitas.gambar;
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

    const filepath = `./public/images/${fasilitas.gambar}`;
    fs.unlinkSync(filepath);
    file.mv(`./public/images/${fileName}`, (err) => {
      if (err) return res.status(500).json({ msg: err.message });
    });
  }
  const { nama, waktu, nominal, alamat } = req.body;
  const url = `${req.protocol}://${req.get("host")}/images/${fileName}`;
  try {
    await Fasilitas.update(
      {
        nama: nama,
        waktu: waktu,
        nominal: nominal,
        gambar: fileName,
        alamat: alamat,
        url: url,
      },
      {
        where: {
          id_fasilitas: req.params.id,
        },
      }
    );
    res.status(200).json({ msg: "Fasilitas berhasil diupdate" });
  } catch (error) {
    console.log(error.message);
  }
};
export const deleteFasilitas = async (req, res) => {
  const fasilitas = await Fasilitas.findOne({
    where: {
      id_fasilitas: req.params.id,
    },
  });
  if (!fasilitas)
    return res.status(404).json({ msg: "Fasilitas tidak ditemukan" });
  try {
    const filepath = `./public/images/${fasilitas.gambar}`;
    fs.unlinkSync(filepath);
    await Fasilitas.destroy({
      where: {
        id: fasilitas.id,
      },
    });
    res.status(200).json({ msg: "Fasilitas berhasil dihapus" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};

export const getCountFasilitas = async (req, res) => {
  try {
    const count = await Fasilitas.count();
    res.status(200).json(count);
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
    const data = await Fasilitas.findOne({
      where: { id_fasilitas: req.params.id },
    });
    const aktif = data.aktif;

    // Periksa nilai kolom aktif saat ini dan buat query untuk mengupdate nilainya
    const newAktif = aktif === 1 ? 0 : 1;
    await Fasilitas.update(
      { aktif: newAktif },
      { where: { id_fasilitas: req.params.id } }
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
