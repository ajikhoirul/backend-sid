import express from "express";
import {
  getPengumuman,
  getPengumumanById,
  createPengumuman,
  updatePengumuman,
  deletePengumuman,
  getPengumumanByLimit,
  updateAktif,
} from "../controllers/Pengumuman.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get("/pengumuman", verifyUser, getPengumuman);
router.get("/pengumuman/:id", getPengumumanById);
router.post("/pengumuman", createPengumuman);
router.patch("/pengumuman/:id", verifyUser, updatePengumuman);
router.delete("/pengumuman/:id", verifyUser, deletePengumuman);
router.get("/pengumuman-limit", getPengumumanByLimit);
router.patch("/pengumuman-aktif/:id", verifyUser, updateAktif);

export default router;
