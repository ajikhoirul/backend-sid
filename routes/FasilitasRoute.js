import express from "express";
import {
  getFasilitas,
  getFasilitasAktif,
  getFasilitasById,
  createFasilitas,
  updateFasilitas,
  deleteFasilitas,
  getCountFasilitas,
  updateAktif,
} from "../controllers/Fasilitas.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get("/fasilitas", verifyUser, getFasilitas);
router.get("/fasilitas-aktif", getFasilitasAktif);
router.get("/fasilitas/:id", verifyUser, getFasilitasById);
router.post("/fasilitas", verifyUser, createFasilitas);
router.patch("/fasilitas/:id", verifyUser, updateFasilitas);
router.delete("/fasilitas/:id", verifyUser, deleteFasilitas);
router.get("/countfasilitas", verifyUser, getCountFasilitas);
router.patch("/fasilitas-aktif/:id", verifyUser, updateAktif);

export default router;
