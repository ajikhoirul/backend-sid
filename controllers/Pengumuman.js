import Pengumuman from "../models/PengumumanModel.js";
import Users from "../models/UserModel.js";
import { Op } from "sequelize";

export const getPengumuman = async (req, res) => {
  try {
    let response;
    // response = await Pengumuman.findAll({
    //   attributes: ["id", "id_pengumuman", "judul", "isi", "aktif", "createdAt"],
    //   include: [
    //     {
    //       model: Users,
    //       attributes: ["name", "email"],
    //     },
    //   ],
    //   order: [["id", "DESC"]],
    // });
    if (req.role === "admin") {
      response = await Pengumuman.findAll({
        attributes: [
          "id",
          "id_pengumuman",
          "judul",
          "isi",
          "aktif",
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
      response = await Pengumuman.findAll({
        attributes: [
          "id",
          "id_pengumuman",
          "judul",
          "isi",
          "aktif",
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
export const getPengumumanById = async (req, res) => {
  try {
    const response = await Pengumuman.findOne({
      attributes: ["id_pengumuman", "judul", "isi", "aktif", "createdAt"],
      where: {
        id_pengumuman: req.params.id,
      },
      include: [
        {
          model: Users,
          attributes: ["name", "email"],
        },
      ],
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};
export const createPengumuman = async (req, res) => {
  const { judul, isi, gambar } = req.body;
  try {
    await Pengumuman.create({
      judul: judul,
      isi: isi,
      gambar: gambar,
      userId: req.userId,
    });
    res.status(201).json({ msg: "Pengumuman berhasil ditambahkan" });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};
export const updatePengumuman = async (req, res) => {
  const pengumuman = await Pengumuman.findOne({
    where: {
      id_pengumuman: req.params.id,
    },
  });
  if (!pengumuman)
    return res.status(404).json({ msg: "Pengumuman tidak ditemukan" });
  const { judul, isi, gambar, aktif } = req.body;
  try {
    await Pengumuman.update(
      {
        judul: judul,
        isi: isi,
        gambar: gambar,
        aktif: aktif,
        userId: req.userId,
      },
      {
        where: {
          id: pengumuman.id,
        },
      }
    );
    res.status(200).json({ msg: "Pengumuman berhasil diupdate" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};
export const deletePengumuman = async (req, res) => {
  const pengumuman = await Pengumuman.findOne({
    where: {
      id_pengumuman: req.params.id,
    },
  });
  if (!pengumuman)
    return res.status(404).json({ msg: "Pengumuman tidak ditemukan" });
  try {
    await Pengumuman.destroy({
      where: {
        id: pengumuman.id,
      },
    });
    res.status(200).json({ msg: "Pengumuman berhasil dihapus" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};

export const getPengumumanByLimit = async (req, res) => {
  try {
    let response;
    response = await Pengumuman.findAll({
      attributes: ["id", "id_pengumuman", "judul", "createdAt", "aktif", "isi"],
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

export const updateAktif = async (req, res) => {
  try {
    // Ambil data dari request body
    const { id } = req.body;

    // Cari data dengan id tertentu dan mengambil nilai kolom aktif saat ini
    const data = await Pengumuman.findOne({
      where: { id_pengumuman: req.params.id },
    });
    const aktif = data.aktif;

    // Periksa nilai kolom aktif saat ini dan buat query untuk mengupdate nilainya
    const newAktif = aktif === 1 ? 0 : 1;
    await Pengumuman.update(
      { aktif: newAktif },
      { where: { id_pengumuman: req.params.id } }
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
