import express from "express";
import {
  getVideo,
  getVideoById,
  saveVideo,
  updateVideo,
} from "../controllers/Video.js";

const router = express.Router();

router.get("/video", getVideo);
router.get("/video/:id", getVideoById);
router.post("/video", saveVideo);
router.patch("/video/:id", updateVideo);

export default router;
