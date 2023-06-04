import express from "express";
import {
  getTentangDesa,
  getTentangDesaById,
  saveTentangDesa,
  updateTentangDesa,
  deleteTentangDesa,
} from "../controllers/TentangDesa.js";

const router = express.Router();

router.get("/tentang-desa", getTentangDesa);
router.get("/tentang-desa/:id", getTentangDesaById);
router.post("/tentang-desa", saveTentangDesa);
router.patch("/tentang-desa/:id", updateTentangDesa);
router.delete("/tentang-desa/:id", deleteTentangDesa);

export default router;
