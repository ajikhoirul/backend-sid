import express from "express";
import {
  getGaleri,
  getGaleriById,
  saveGaleri,
  updateGaleri,
} from "../controllers/Galeri.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get("/galeri", getGaleri);
router.get("/galeri/:id", getGaleriById);
router.post("/galeri", verifyUser, saveGaleri);
router.patch("/galeri/:id", verifyUser, updateGaleri);
export default router;
