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
addFormats(ajv, { formats: ['email'], mode: "fast" }).addKeyword('kind').addKeyword('modifier');
addErrors(ajv, { keepErrors: false });

const empresa = express.Router();

let jwt;



//Get Empresa
empresa.get("/getAll", async (req, res) => {

    const fetch = await runQuery(`CALL getEmpresa(0)`);
    res.send(fetch);
});

// ------------------------------------INSERT-----------------------------------------

//Insert Empresa
empresa.post("/insert", upload.none(), async (req, res) => {

    const { cuit, nombre, rubro, descripcion, ubicacion, correo, img, telefono } = req.body;

    const schema = Type.Object({
        cuit: Type.String({
            errorMessage: {
                type: "Debe aaaa ser un Number"
            }
        }),
        nombre: Type.String({
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
        ubicacion: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        correo: Type.String({
            format: "email",
            errorMessage: {
                type: "Debe ser un String",
                format: "Debe ser formato email"
            }

        }),
        img: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        telefono: Type.String({
            errorMessage: {
                type: "Debe ser un Number"
            }
        })

    }, {
        required: [cuit, nombre, rubro, descripcion, ubicacion, correo, img, telefono],
        additionalProperties: false
    });

    const validate = ajv.compile(schema);


    const isValid = validate(req.body);

    //Si no es valido devolvemos err 400
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`SELECT setEmpresa('${cuit}','${nombre}','${rubro}','${descripcion}','${ubicacion}','${correo}','${img}','${telefono}') AS consulta`, true)
    if (fetch == false) return res.send(false);
    res.send(true);

});

// ------------------------------------MIDDLEWARE----------------------------------------- 

//Session 
empresa.use(async (req, res, next) => {
    jwt = await validateToken(req, res, next);
    next();
})


// ------------------------------------GET-----------------------------------------

//Get Empresa
empresa.get("/get/:id", async (req, res) => {

    const fetch = await runQuery(`CALL getEmpresa(${req.params.id})`);
    res.send(fetch[0]);
});

// ------------------------------------UPDATE-----------------------------------------

//Update Empresa
empresa.patch("/update/:id", (req, res) => {

    const { cuit, nombre, rubro, descripcion, ubicacion, correo, img, telefono } = req.body;

    const schema = Type.Object({
        cuit: Type.Number({
            errorMessage: {
                type: "Debe ser un Number"
            }
        }),
        nombre: Type.String({
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
        ubicacion: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        correo: Type.String({
            format: "correo"
        }),
        img: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        telefono: Type.Number({
            errorMessage: {
                type: "Debe ser un Number"
            }
        })

    }, {
        required: [cuit, nombre, rubro, descripcion, ubicacion, correo, img, telefono],
        additionalProperties: false
    });

    const validate = ajv.compile(schema);


    const isValid = validate(req.body);

    //Si no es valido devolvemos err 400
    if (!isValid) return res.status(400).send(validate.errors);

    runQuery(`SELECT updateEmpresa(${cuit},${nombre},${rubro},${descripcion},${ubicacion},${correo},${img},${telefono}) AS consulta`, true)
        .then((rs) => {
            res.send(rs);
        });

});

// ------------------------------------DELETE-----------------------------------------

//Delete Empresa
empresa.delete("/delete/:id", async (req, res) => {

    const fetch = await runQuery(`CALL deleteEmpresa(${req.params.id})`, true);
    if (fetch.consulta == false) return res.send(false);
    res.send(true);
});

export default empresa;