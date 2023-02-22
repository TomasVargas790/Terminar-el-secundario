import express from "express";
import Ajv from "ajv";
import addErrors from "ajv-errors";
import addFormats from "ajv-formats"
import { Type } from "@sinclair/typebox";
import runQuery from "../helper/connect.js";
import { validateToken , generateAccessToken        } from "../helper/validateToken.js";
import multer from "multer";
const upload = multer({ dest: "../upload/" });


const ajv = new Ajv({ allErrors: true });
addFormats(ajv, { formats: ['email', "password"], mode: "fast" }).addKeyword('kind').addKeyword('modifier');
addErrors(ajv, { keepErrors: false });

const empleador = express.Router();

let jwt;

// ------------------------------------LOGIN/REGISTER----------------------------------------- 
//Register
empleador.post("/register", upload.none(), async (req, res) => {


    const { nombre, apellido, dni, correo, telefono, empresa, hash } = req.body;

    //Validamos formatos del objeto que entra
    const schema = Type.Object({

        nombre: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        apellido: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        correo: Type.String({
            format: "email",
            errorMessage:
            {
                type: "Debe ser un String",
                format: "Debe ser formato email"
            }
        }),
        dni: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        telefono: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        empresa: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        hash: Type.String({
            format: "password",
            errorMessage: {
                type: "Debe ser un String",
                format: "Debe ser formato password"
            }
        })
    },
        {
            required: [nombre, apellido, correo, dni, telefono, empresa, hash],
            additionalProperties: false,
        });


    const validate = ajv.compile(schema);
    const isValid = validate(req.body);
    //Si no es valido devolvemos err 400
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`SELECT setEmpleador( "${nombre}", "${apellido}", "${correo}", "${dni}", "${telefono}", "${empresa}", "${hash}" ) AS consulta`)


    if (fetch.consulta !== "REGISTRO CREADO") {
        return res.send(false);
    } else {
        return res.send(true);
    }
});

//Login
empleador.post("/login", upload.none(), async (req, res) => {
    const { correo, hash } = req.body;

    const schema = Type.Object({
        correo: Type.String({
            format: "email",
            errorMessage: {
                type: "Debe ser un String",
                format: "Debe ser formato email"
            }
        }),
        hash: Type.String({
            format: "password",
            errorMessage: {
                type: "Debe ser un String",
                format: "Debe ser formato password"
            }
        })
    },
        {
            required: [correo, hash],
            additionalProperties: false
        });

    const validate = ajv.compile(schema);
    const isValid = validate(req.body);
    if (!isValid) res.status(400).send(validate.errors);

    const fetch = await runQuery(`CALL logEmpleador( "${correo}", "${hash}")`,true);

    if (fetch.consulta === "Contraseña incorrecta") {
        return res.send(false);
    }
    else {
        const accessToken = generateAccessToken({ id: fetch.id_empleador, empleado: false });
        res.header('authorization', accessToken);
        res.send(true);


    }
});

// ------------------------------------MIDDLEWARE-----------------------------------------
//Session
empleador.use(async (req,res,next) => {
    jwt = await validateToken(req, res, next);
    if (jwt.empleado === true) return res.send("Error en la autenticacion");
    console.log(jwt);
    next();
})

// ------------------------------------GET-----------------------------------------
//Get Empleador
empleador.get("/get", async (req, res) => {
    const fetch = await runQuery(`CALL getEmpleador(${jwt.id})`)

    res.send(fetch[0]);
});

// ------------------------------------UPDATE-----------------------------------------
//Update Empleador
empleador.patch("/update", upload.none(),async (req, res) => {

    const { nombre, apellido, dni, correo, telefono, empresa, hash } = req.body;

    //Validamos formatos del objeto que entra
    const schema = Type.Object({

        nombre: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        apellido: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        correo: Type.String({
            format: "email",
            errorMessage:
            {
                type: "Debe ser un String",
                format: "Debe ser formato email"
            }
        }),
        dni: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        telefono: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        empresa: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        hash: Type.String({
            format: "password",
            errorMessage: {
                type: "Debe ser un String",
                format: "Debe ser formato password"
            }
        })
    },
        {
            required: [nombre, apellido, dni, correo, telefono, empresa, hash],
            additionalProperties: false,
        });


    const validate = ajv.compile(schema);
    const isValid = validate(req.body);
    //Si no es valido devolvemos err 400
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`SELECT updateEmpleador(${jwt.id}, "${nombre}", "${apellido}", "${dni}", "${correo}", "${telefono}", "${empresa}", "${hash}" ) AS consulta`)

    if (fetch.consulta !== "REGISTRO ACTUALIZADO") {
        return res.send(fetch);
    } else {
        return res.send(true);
    }

});

// ------------------------------------DELETE-----------------------------------------
//Delete Empleador
empleador.delete("/delete", async (req, res) => {
    const fetch = await runQuery(`CALL deleteEmpleador(${jwt.id})`, true);
    if (fetch.consulta == false) return res.send(false);
    res.send(true);
    //jwt destroy en front, eliminando del localStorage ademas

});

export default empleador;