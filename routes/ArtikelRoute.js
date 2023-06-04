import express from "express";
import {
  getArtikel,
  getArtikelAktif,
  getArtikelById,
  createArtikel,
  updateArtikel,
  deleteArtikel,
  getCountArtikel,
  getArtikelByLimit,
  updateAktif,
} from "../controllers/Artikel.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get("/artikel", verifyUser, getArtikel);
router.get("/artikel-aktif", getArtikelAktif);
router.get("/artikel/:id", getArtikelById);
router.post("/artikel", verifyUser, createArtikel);
router.patch("/artikel/:id", verifyUser, updateArtikel);
router.delete("/artikel/:id", verifyUser, deleteArtikel);
router.get("/countartikel", verifyUser, getCountArtikel);
router.get("/artikel-limit", getArtikelByLimit);
router.patch("/artikel-aktif/:id", verifyUser, updateAktif);

export default router;
