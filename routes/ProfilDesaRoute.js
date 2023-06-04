import express from "express";
import {
  getProfilDesa,
  getProfilDesaById,
  saveProfilDesa,
  updateProfilDesa,
  deleteProfilDesa,
} from "../controllers/ProfilDesa.js";

const router = express.Router();

router.get("/profil-desa", getProfilDesa);
router.get("/profil-desa/:id", getProfilDesaById);
router.post("/profil-desa", saveProfilDesa);
router.patch("/profil-desa/:id", updateProfilDesa);
router.delete("/profil-desa/:id", deleteProfilDesa);

export default router;
