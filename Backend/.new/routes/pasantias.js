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

const pasantias = express.Router();
let jwt;
// ------------------------------------MIDDLEWARE-----------------------------------------
//Session
pasantias.use(async (req, res, next) => {
    jwt = await validateToken(req, res, next);
    console.log(jwt);
    next();
})

// ------------------------------------GET-----------------------------------------

//Get Pasantias
pasantias.get("/get/:id", async (req, res) => {
    const fetch = await runQuery(`CALL getPasantias (${req.params.id}) `)
    res.send(fetch[0]);
});
//Get Pasantias
pasantias.get("/getAll", async (req, res) => {
    const fetch = await runQuery(`CALL getPasantias (0) `)
    res.send(fetch);
});
//Get Pasantias
pasantias.get("/getPasantiasFromEmpresa/:id", async (req, res) => {
    const fetch = await runQuery(`CALL getPasantiasFromEmpresa (${req.params.id}) `);
    res.send(fetch);
});

// ------------------------------------INSERT-----------------------------------------

//Insert Pasantias
pasantias.post("/insert", upload.none(), async (req, res) => {

    const { titulo, descripcion, cantidad, requisitos } = req.body;

    const schema = Type.Object({
        titulo: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        descripcion: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        requisitos: Type.String({
            format: "date",
            errorMessage: {
                type: "Debe ser una fecha",
                format: "Debe estar en formato fecha"
            }
        }),
        cantidad: Type.Number({
            errorMessage: {
                type: "Debe ser un numero",
                format: "Debe ser en formato double"
            }
        })
    }, {
        required: [titulo, descripcion, cantidad, requisitos],
        additionalProperties: false,
    });

    const validate = ajv.compile(schema);
    const isValid = validate(req.body);
    //Si no es valido devolvemos err 400
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`SELECT setPasantias( "${titulo}", "${descripcion}", "${salario}", "${ubicacion}", "${requisitos}", "${jwt.empresa}") AS consulta`, true);
    if (fetch.consulta !== "REGISTRO CREADO") return res.send(fetch.consulta);
    res.send(true);

});

// ------------------------------------UPDATE-----------------------------------------

//Update Pasantias
pasantias.patch("/update/:id", async (req, res) => {
    const { titulo, descripcion, cantidad, requisitos } = req.body;

    const schema = Type.Object({
        titulo: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        descripcion: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        requisitos: Type.String({
            format: "date",
            errorMessage: {
                type: "Debe ser una fecha",
                format: "Debe estar en formato fecha"
            }
        }),
        cantidad: Type.Number({
            errorMessage: {
                type: "Debe ser un numero",
                format: "Debe ser en formato double"
            }
        })
    }, {
        required: [titulo, descripcion, cantidad, requisitos],
        additionalProperties: false,
    });

    const validate = ajv.compile(schema);
    const isValid = validate(req.body);
    //Si no es valido devolvemos err 400
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`SELECT updatePasantias( "${titulo}", "${descripcion}", "${salario}", "${ubicacion}", "${requisitos}", "${jwt.empresa}") AS consulta`, true);
    if (fetch.consulta !== "REGISTRO ACTUALIZADO") return res.send(fetch.consulta);
    res.send(true);

});

// ------------------------------------DELETE-----------------------------------------

//Delete Pasantias
pasantias.delete("/delete/:id", async (req, res) => {
    const fetch = await runQuery(`CALL deletePasantias(${req.params.id})`, true);
    if (fetch.consulta == false) return res.send(false);
    res.send(true);
});
export default pasantias;