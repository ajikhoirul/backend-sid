import ProfilDesa from "../models/ProfilDesaModel.js";
import path from "path";

export const getProfilDesa = async (req, res) => {
  try {
    const response = await ProfilDesa.findAll();
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const getProfilDesaById = async (req, res) => {
  try {
    const response = await ProfilDesa.findOne({
      where: {
        id_profil: req.params.id,
      },
    });
    res.status(200).json(response);
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};

export const saveProfilDesa = async (req, res) => {
  const { nama_desa, alamat, notelp, email } = req.body;
  try {
    await ProfilDesa.create({
      nama_desa: nama_desa,
      alamat: alamat,
      notelp: notelp,
      email: email,
    });
    res.status(201).json({ msg: "Profil Desa berhasil ditambahkan" });
  } catch (error) {
    res.status(500).json({ msg: error.message });
  }
};
export const updateProfilDesa = async (req, res) => {
  const profilDesa = await ProfilDesa.findOne({
    where: {
      id_profil: req.params.id,
    },
  });
  if (!profilDesa)
    return res.status(404).json({ msg: "Profil Desa tidak ditemukan" });
  const { nama_desa, alamat, notelp, email } = req.body;
  try {
    await ProfilDesa.update(
      {
        nama_desa: nama_desa,
        alamat: alamat,
        notelp: notelp,
        email: email,
      },
      {
        where: {
          id: profilDesa.id,
        },
      }
    );
    res.status(200).json({ msg: "Profil Desa berhasil diupdate" });
  } catch (error) {
    res.status(400).json({ msg: error.message });
  }
};
export const deleteProfilDesa = (req, res) => {};
