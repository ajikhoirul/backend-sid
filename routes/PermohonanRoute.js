import express from "express";
import {
  getPermohonan,
  getPermohonanById,
  savePermohonan,
  updateAktif,
  deletePermohonan,
} from "../controllers/Permohonan.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get("/permohonan", getPermohonan);
router.get("/permohonan/:id", getPermohonanById);
router.post("/permohonan", savePermohonan);
router.patch("/permohonan-aktif/:id", updateAktif);
router.delete("/permohonan/:id", deletePermohonan);
export default router;
