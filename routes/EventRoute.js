import express from "express";
import { getAllEvent, createEvent, deleteEvent } from "../controllers/Event.js";
import { verifyUser } from "../middleware/AuthUser.js";

const router = express.Router();

router.get("/event", verifyUser, getAllEvent);
router.post("/event", verifyUser, createEvent);
router.delete("/event/:id", verifyUser, deleteEvent);

export default router;
