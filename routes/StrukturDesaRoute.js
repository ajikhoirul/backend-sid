import express from "express";
import {
  getStrukturDesa,
  getStrukturDesaById,
  saveStrukturDesa,
  updateStrukturDesa,
  deleteStrukturDesa,
} from "../controllers/StrukturDesa.js";

const router = express.Router();

router.get("/struktur-desa", getStrukturDesa);
router.get("/struktur-desa/:id", getStrukturDesaById);
router.post("/struktur-desa", saveStrukturDesa);
router.patch("/struktur-desa/:id", updateStrukturDesa);
router.delete("/struktur-desa/:id", deleteStrukturDesa);

export default router;
