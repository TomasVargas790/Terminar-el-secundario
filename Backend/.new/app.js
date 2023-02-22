import express from "express";
import dotenv from "dotenv";
import cookieParser from "cookie-parser";
import multer from "multer";
const upload = multer();

import empresa from "./routes/empresa.js";
import empleador from "./routes/empleador.js";
import postulado from "./routes/postulado.js";
import experiencia from "./routes/experiencia.js";
import estudios from "./routes/estudios.js";
import idioma from "./routes/idioma.js";
import vacante from "./routes/vacante.js";
import empleado from "./routes/empleado.js";
import pasantias from "./routes/pasantias.js";

dotenv.config();
const PORT = process.env.PORT

const expressApp = express();

expressApp.use(express.text());
expressApp.use(express.json());
expressApp.use(cookieParser());
expressApp.use((req, res, next) => {
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers", "*");
    res.header("Access-Control-Expose-Headers", "*");
    res.header("Access-Control-Allow-Methods", "GET,POST,PATCH,DELETE");
    res.header('Access-Control-Allow-Credentials', 'true');
    res.header('Content-Type', 'application/json; charset=utf-8');
    next();
});

expressApp.use("/empleado", empleado);
expressApp.use("/empleador", empleador);
expressApp.use("/empresa", empresa);
expressApp.use("/postulado", postulado);
expressApp.use("/experiencia", experiencia);
expressApp.use("/estudios", estudios);
expressApp.use("/idioma", idioma);
expressApp.use("/vacante", vacante);
expressApp.use("/pasantias", pasantias);


expressApp.listen(PORT, () => {
    console.log(`Server en puerto ${PORT}`)
})