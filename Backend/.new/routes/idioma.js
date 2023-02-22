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

const idioma = express.Router();
let jwt;

// ------------------------------------MIDDLEWARE-----------------------------------------
//Session
idioma.use(async (req, res, next) => {
    jwt = await validateToken(req, res, next);
    console.log(jwt);
    next();
})

// ------------------------------------GET-----------------------------------------

//Get Idioma

idioma.get("/get", async (req, res) => {
    const fetch = await runQuery(`CALL getIdioma (${jwt.id})`)
    res.send(fetch);
});
idioma.get("/get/:id", async (req, res) => {
    const fetch = await runQuery(`CALL getIdioma (${req.params.id})`)
    res.send(fetch);
});


// ------------------------------------INSERT-----------------------------------------

//Insert Idioma

idioma.post("/insert", upload.none(), async (req, res) => {

    const { idioma, nivel } = req.body;

    const schema = Type.Object({
        idioma: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        nivel: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        })
    });

    const validate = ajv.compile(schema);


    const isValid = validate(req.body);

    //Si no es valido devolvemos err 400
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`SELECT setIdioma( "${jwt.id}", "${idioma}", "${nivel}" ) AS consulta`);
    if (fetch.consulta !== "REGISTRO CREADO") return res.send(fetch);
    res.send(true);
});


// ------------------------------------UPDATE-----------------------------------------

//Update Idioma

idioma.patch("/update/:id", upload.none(), async (req, res) => {

    const { idioma, nivel } = req.body;

    const schema = Type.Object({
        idioma: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        nivel: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        })
    });

    const validate = ajv.compile(schema);


    const isValid = validate(req.body);

    //Si no es valido devolvemos err 400
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`SELECT updateIdioma( "${req.params.id}", "${idioma}", "${nivel}" ) AS consulta`);
    if (fetch.consulta !== "REGISTRO ACTUALIZADO") return res.send(fetch);
    res.send(true);
});


// ------------------------------------DELETE-----------------------------------------

//Delete Idioma

idioma.delete("/delete/:id", async (req, res) => {
    const fetch = await runQuery(`SELECT deleteIdioma(${req.params.id}) AS consulta`);
    if (fetch.consulta == false) return res.send(false);
    res.send(true);
});

export default idioma;