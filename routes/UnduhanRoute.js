import express from "express";
import {
  getUnduhan,
  getUnduhanAktif,
  getUnduhanById,
  createUnduhan,
  updateUnduhan,
  deleteUnduhan,
  updateAktif,
  getUnduhanByLimit,
} from "../controllers/Unduhan.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get("/unduhan", getUnduhan);
router.get("/unduhan-aktif", getUnduhanAktif);
router.get("/unduhan/:id", getUnduhanById);
router.post("/unduhan", createUnduhan);
router.patch("/unduhan/:id", updateUnduhan);
router.delete("/unduhan/:id", deleteUnduhan);
router.patch("/unduhan-aktif/:id", updateAktif);
router.get("/unduhan-aktif", getUnduhanByLimit);

export default router;
