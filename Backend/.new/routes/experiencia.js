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

const experiencia = express.Router();
let jwt;
// ------------------------------------MIDDLEWARE-----------------------------------------
//Session
experiencia.use(async (req, res, next) => {
    jwt = await validateToken(req, res, next);
    console.log(jwt);
    next();
})

// ------------------------------------GET-----------------------------------------

//Get Experiencia
experiencia.get("/get", async (req, res) => {
    const fetch = await runQuery(`CALL getExperiencia (${jwt.id})`)
    res.send(fetch);
});

//Get Experiencia
experiencia.get("/get/:id", async (req, res) => {
    const fetch = await runQuery(`CALL getExperiencia (${req.params.id})`)
    res.send(fetch);
});
// ------------------------------------INSERT-----------------------------------------

//Insert Experiencia
experiencia.post("/insert", upload.none(), async (req, res) => {

    const { empresa, titulo, rubro, descripcion, fecha_inicio, fecha_fin } = req.body;

    const schema = Type.Object({
        empresa: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        titulo: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        rubro: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        descripcion: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        fecha_inicio: Type.String({
            //format: "date",
            errorMessage: {
                type: "Debe ser una fecha",
                format: "Debe estar en formato fecha"
            }
        }),
        fecha_fin: Type.String({
            //format: "date",
            errorMessage: {
                type: "Debe ser una fecha",
                format: "Debe estar en formato fecha"
            }
        })
    }, {
        required: [empresa,titulo, rubro, descripcion, fecha_inicio, fecha_fin],
        additionalProperties: false
    });

    const validate = ajv.compile(schema);
    const isValid = validate(req.body);
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`SELECT setExperiencia( "${jwt.id}", "${empresa}", "${titulo}", "${rubro}", "${descripcion}", ${fecha_inicio}, ${fecha_fin}) AS consulta`)
    if (fetch.consulta !== "REGISTRO CREADO") return res.send(fetch.consulta);
    res.send(true);

});

// ------------------------------------UPDATE-----------------------------------------

//Update Experiencia
experiencia.patch("/update/:id", upload.none(), async (req, res) => {

    const { empresa, titulo, rubro, descripcion, fecha_inicio, fecha_fin } = req.body;

    const schema = Type.Object({
        empresa: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        titulo: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        rubro: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        descripcion: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        fecha_inicio: Type.String({
            format: "date",
            errorMessage: {
                type: "Debe ser una fecha",
                format: "Debe estar en formato fecha"
            }
        }),
        fecha_fin: Type.String({
            format: "date",
            errorMessage: {
                type: "Debe ser una fecha",
                format: "Debe estar en formato fecha"
            }
        })
    }, {
        required: [empresa,titulo, rubro, descripcion, fecha_inicio, fecha_fin],
        additionalProperties: false
    });

    const validate = ajv.compile(schema);
    const isValid = validate(req.body);
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`SELECT updateExperiencia( "${req.params.id}", "${empresa}", "${titulo}", "${rubro}", "${descripcion}", "${fecha_inicio}", "${fecha_fin}" AS consulta`)
    if (fetch.consulta !== "REGISTRO CREADO") return res.send(fetch.consulta);
    res.send(true);
});

// ------------------------------------DELETE-----------------------------------------

//Delete Experiencia
experiencia.delete("/delete/:id", async (req, res) => {
    const fetch = await runQuery(`SELECT deleteExperiencia(${req.params.id}) AS consulta`);
    if (fetch.consulta == false) return res.send(false);
    res.send(true);
});

export default experiencia;