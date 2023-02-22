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

const vacante = express.Router();
let jwt;
// ------------------------------------MIDDLEWARE-----------------------------------------
//Session
vacante.use(async (req, res, next) => {
    jwt = await validateToken(req, res, next);
    console.log(jwt);
    next();
})

// ------------------------------------GET-----------------------------------------

//Get Vacante
vacante.get("/get/:id", async (req, res) => {
    const fetch = await runQuery(`CALL getVacante (${req.params.id}) `)
    res.send(fetch[0]);
});
vacante.get("/getVacanteFromEmpresa/:id", async (req, res) => {
    const fetch = await runQuery(`CALL getVacanteFromEmpresa (${req.params.id}) `)
    res.send(fetch);
});
//GetAll Vacante
vacante.get("/getAll", async (req, res) => {
    const fetch = await runQuery(`CALL getVacante (0) `)
    res.send(fetch);
});

// ------------------------------------INSERT-----------------------------------------

//Insert Vacante
vacante.post("/insert", upload.none(), async (req, res) => {

    const { titulo, descripcion, salario, ubicacion, requisitos, empresa } = req.body;

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
        salario: Type.Number({
            format: "double",
            errorMessage: {
                type: "Debe ser un numero",
                format: "Debe ser en formato double"
            }
        }),
        ubicacion: Type.String({
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
        })
    }, {
        required: [titulo, descripcion, salario, ubicacion, requisitos, empresa],
        additionalProperties: false,
    });

    const validate = ajv.compile(schema);
    const isValid = validate(req.body);
    //Si no es valido devolvemos err 400
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`SELECT setVacante( "${titulo}", "${descripcion}", "${salario}", "${ubicacion}", "${requisitos}", "${jwt.empresa}") AS consulta`, true);
    if (fetch.consulta !== "REGISTRO CREADO") return res.send(fetch.consulta);
    res.send(true);

});

// ------------------------------------UPDATE-----------------------------------------

//Update Vacante
vacante.patch("/update/:id", async (req, res) => {
    const { titulo, descripcion, salario, ubicacion, requisitos, empresa } = req.body;

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
        salario: Type.Number({
            format: "double",
            errorMessage: {
                type: "Debe ser un numero",
                format: "Debe ser en formato double"
            }
        }),
        ubicacion: Type.String({
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
        })
    }, {
        required: [titulo, descripcion, salario, ubicacion, requisitos, empresa],
        additionalProperties: false,
    });

    const validate = ajv.compile(schema);
    const isValid = validate(req.body);
    //Si no es valido devolvemos err 400
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`SELECT updateVacante( "${titulo}", "${descripcion}", "${salario}", "${ubicacion}", "${requisitos}", "${jwt.empresa}") AS consulta`, true);
    if (fetch.consulta !== "REGISTRO ACTUALIZADO") return res.send(fetch.consulta);
    res.send(true);

});

// ------------------------------------DELETE-----------------------------------------

//Delete Vacante
vacante.delete("/delete/:id", async (req, res) => {
    const fetch = await runQuery(`CALL deleteVacante(${req.params.id})`, true);
    if (fetch.consulta == false) return res.send(false);
    res.send(true);
});
export default vacante;