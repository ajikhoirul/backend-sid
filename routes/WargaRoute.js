import express from "express";
import {
  getWarga,
  getWargaById,
  getPemohonByNik,
  createWarga,
  updateWarga,
  deleteWarga,
  getCountWarga,
  getBapakByNik,
  getIbuByNik,
} from "../controllers/Warga.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get("/warga", verifyUser, getWarga);
router.get("/warga/:id", verifyUser, getWargaById);
router.get("/pemohon/:nik", getPemohonByNik);
router.get("/bapak/:nik", getBapakByNik);
router.get("/ibu/:nik", getIbuByNik);
router.post("/warga", verifyUser, createWarga);
router.patch("/warga/:id", verifyUser, updateWarga);
router.delete("/warga/:id", verifyUser, deleteWarga);
router.get("/countwarga", verifyUser, getCountWarga);

export default router;
