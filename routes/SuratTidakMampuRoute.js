import express from "express";
import {
  getSuratTidakMampu,
  getSuratTidakMampuById,
  createSuratTidakMampu,
  deleteSuratTidakMampu,
  updateAktif,
  getCountSuratTdk,
} from "../controllers/SuratTidakMampu.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get("/surat-tidak-mampu", getSuratTidakMampu);
router.get("/surat-tidak-mampu/:id", getSuratTidakMampuById);
router.post("/surat-tidak-mampu", createSuratTidakMampu);
router.delete("/surat-tidak-mampu/:id", deleteSuratTidakMampu);
router.patch("/surat-tidak-mampu-aktif/:id", updateAktif);
router.get("/count-surat-tidak-mampu", getCountSuratTdk);

export default router;
