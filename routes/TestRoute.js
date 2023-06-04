import express from "express";
import {
  getTest,
  getTestById,
  saveTest,
  updateTest,
  deleteTest,
} from "../controllers/Test.js";

const router = express.Router();

router.get("/test", getTest);
router.get("/test/:id", getTestById);
router.post("/test", saveTest);
router.patch("/test/:id", updateTest);
router.delete("/test/:id", deleteTest);

export default router;
