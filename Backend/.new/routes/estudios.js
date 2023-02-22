import express from "express";
import Ajv from "ajv";
import addErrors from "ajv-errors";
import addFormats from "ajv-formats"
import { Type } from "@sinclair/typebox";
import runQuery from "../helper/connect.js";
import { validateToken } from "../helper/validateToken.js";
import multer from "multer";
const upload = multer({ dest: "../upload/" });


const ajv = new Ajv({ allErrors: true });
addFormats(ajv, { formats: ["date", "double"], mode: "fast" }).addKeyword('kind').addKeyword('modifier');
addErrors(ajv, { keepErrors: false });

const estudios = express.Router();

let jwt;
// ------------------------------------MIDDLEWARE-----------------------------------------
//Session
estudios.use(async (req, res, next) => {
    jwt = await validateToken(req, res, next);
    console.log(jwt);
    next();
})

// ------------------------------------GET-----------------------------------------

//Get Estudio
estudios.get("/get", async (req, res) => {
    const fetch = await runQuery(`CALL getEstudios (${jwt.id})`)
    res.send(fetch);
});
//Get Estudio
estudios.get("/get/:id", async (req, res) => {
    const fetch = await runQuery(`CALL getEstudios (${req.params.id})`)
    res.send(fetch);
});

// ------------------------------------INSERT-----------------------------------------

//Insert Estudio
estudios.post("/insert", upload.none(), async (req, res) => {

    const { titulo, promedio, descripcion, fecha_inicio, fecha_fin } = req.body;

    const schema = Type.Object({
        titulo: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        promedio: Type.String({
            format: "double",
            errorMessage: {
                type: "Debe ser un numero",
                format: "Debe ser en formato double"
            }
        }),
        descripcion: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        fecha_inicio: Type.String({
            errorMessage: {
                type: "Debe ser una fecha",
            }
        }),
        fecha_fin: Type.String({
            errorMessage: {
                type: "Debe ser una fecha",
            }
        }),
    }, {
        required: [titulo, promedio, descripcion, fecha_inicio, fecha_fin],
        additionalProperties: false,
    });

    const validate = ajv.compile(schema);
    const isValid = validate(req.body);
    //Si no es valido devolvemos err 400
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`SELECT setEstudios( ${jwt.id},"${titulo}", "${promedio}", "${descripcion}", "${fecha_inicio}", "${fecha_fin}") AS consulta`);
    if (fetch.consulta !== "REGISTRO CREADO") return res.send(fetch);
    res.send(true);
});

// ------------------------------------UPDATE-----------------------------------------

//Update Estudio
estudios.patch("/update/:id", upload.none(), async (req, res) => {
    const { titulo, promedio, descripcion, fecha_inicio, fecha_fin } = req.body;

    const schema = Type.Object({
        titulo: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        promedio: Type.String({
            //format: "double",
            errorMessage: {
                type: "Debe ser un numero",
                format: "Debe ser en formato double"
            }
        }),
        descripcion: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        fecha_inicio: Type.String({
            errorMessage: {
                type: "Debe ser una fecha",
            }
        }),
        fecha_fin: Type.String({
            errorMessage: {
                type: "Debe ser una fecha",
            }
        }),
    }, {
        required: [titulo, promedio, descripcion, fecha_inicio, fecha_fin],
        additionalProperties: false,
    });

    const validate = ajv.compile(schema);
    const isValid = validate(req.body);
    //Si no es valido devolvemos err 400
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`SELECT updateEstudios( "${req.params.id}", "${titulo}", "${promedio}", "${descripcion}", "${fecha_inicio}", "${fecha_fin}") AS consulta`);
    if (fetch.consulta !== "REGISTRO ACTUALIZADO") return res.status(400).send(fetch);
    res.send(true);
});

// ------------------------------------DELETE-----------------------------------------

//Delete Estudio
estudios.delete("/delete/:id", async (req, res) => {
    const fetch = await runQuery(`SELECT deleteEstudios(${req.params.id}) AS consulta`);
    console.log(fetch);
    if (fetch.consulta == 0) return res.send(false);
    res.send(true);
});

export default estudios;