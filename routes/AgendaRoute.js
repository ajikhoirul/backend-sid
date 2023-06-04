import express from "express";
import {
  getAgenda,
  getAgendaById,
  createAgenda,
  updateAgenda,
  deleteAgenda,
  getCountAgenda,
  getAgendaByLimit,
  updateAktif,
} from "../controllers/Agenda.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get("/agenda", verifyUser, getAgenda);
router.get("/agenda/:id", verifyUser, getAgendaById);
router.post("/agenda", verifyUser, createAgenda);
router.patch("/agenda/:id", verifyUser, updateAgenda);
router.delete("/agenda/:id", verifyUser, deleteAgenda);
router.get("/countagenda", verifyUser, getCountAgenda);
router.get("/agenda-limit", getAgendaByLimit);
router.patch("/agenda-aktif/:id", verifyUser, updateAktif);

export default router;
