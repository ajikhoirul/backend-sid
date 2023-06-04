import express from "express";
import FileUpload from "express-fileupload";
// import FileUpload from "express-fileupload";
import cors from "cors";
import session from "express-session";
import dotenv from "dotenv";
import UserRoute from "./routes/UserRoute.js";
import ProductRoute from "./routes/ProductRoute.js";
import db from "./config/Database.js";
import AuthRoute from "./routes/AuthRoute.js";
import SequelizeStore from "connect-session-sequelize";
import AgendaRoute from "./routes/AgendaRoute.js";
import FasilitasRoute from "./routes/FasilitasRoute.js";
import ArtikelRoute from "./routes/ArtikelRoute.js";
import PengumumanRoute from "./routes/PengumumanRoute.js";
import WargaRoute from "./routes/WargaRoute.js";
import PertanyaanRoute from "./routes/PertanyaanRoute.js";
import EventRoute from "./routes/EventRoute.js";
import TestRoute from "./routes/TestRoute.js";
import GaleriRoute from "./routes/GaleriRoute.js";
import UnduhanRoute from "./routes/UnduhanRoute.js";
import PermohonanRoute from "./routes/PermohonanRoute.js";
import SuratTidakMampuRoute from "./routes/SuratTidakMampuRoute.js";
import TentangDesaRoute from "./routes/TentangDesaRoute.js";
import VideoRoute from "./routes/VideoRoute.js";
import ProfilDesaRoute from "./routes/ProfilDesaRoute.js";
import StrukturDesaRoute from "./routes/StrukturDesaRoute.js";

dotenv.config();

const app = express();

const sessionStore = SequelizeStore(session.Store);
const store = new sessionStore({
  db: db,
});

// (async () => {
//   await db.sync();
// })();

app.use(
  session({
    secret: process.env.SESS_SECRET,
    resave: false,
    saveUninitialized: true,
    store: store,
    cookie: {
      secure: "auto",
    },
  })
);

app.use(
  cors({
    credentials: true,
    origin: true,
  })
);
// app.use(
//   cors({
//     credentials: true,
//     origin: [
//       "http://localhost:3000",
//       "http://localhost:3001",
//       "http://localhost:55816",
//     ],
//   })
// );
app.use(FileUpload());
app.use(express.json());
app.use(UserRoute);
app.use(ProductRoute);
app.use(AuthRoute);
app.use(AgendaRoute);
app.use(ArtikelRoute);
app.use(FasilitasRoute);
app.use(PengumumanRoute);
app.use(WargaRoute);
app.use(TestRoute);
app.use(PertanyaanRoute);
app.use(EventRoute);
app.use(GaleriRoute);
app.use(UnduhanRoute);
app.use(PermohonanRoute);
app.use(SuratTidakMampuRoute);
app.use(TentangDesaRoute);
app.use(VideoRoute);
app.use(ProfilDesaRoute);
app.use(StrukturDesaRoute);
app.use(express.static("public"));

// store.sync();

app.listen(process.env.APP_PORT, () => {
  console.log("Server up running...");
});
