import express from "express";
import Ajv from "ajv";
import addErrors from "ajv-errors";
import addFormats from "ajv-formats"
import { Type } from "@sinclair/typebox";
import runQuery from "../helper/connect.js";
import dotenv from "dotenv";
import { validateToken, generateAccessToken } from "../helper/validateToken.js";
import multer from "multer";
const upload = multer({ dest: "../upload/" });

dotenv.config();

const ajv = new Ajv({ allErrors: true });
addFormats(ajv, { formats: ['email', "password"], mode: "fast" }).addKeyword('kind').addKeyword('modifier');
addErrors(ajv, { keepErrors: false });

const empleado = express.Router();

let jwt;

// ------------------------------------LOGIN/REGISTER-----------------------------------------
//Register
empleado.post("/register", upload.none(), async (req, res) => {

    const { nombre, apellido, dni, correo, telefono, img, ubicacion, cv, hash } = req.body;
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
        dni: Type.String({
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
        telefono: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        img: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        ubicacion: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        cv: Type.String({
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
            required: [nombre, apellido, dni, correo, telefono, img, ubicacion, cv, hash],
            additionalProperties: false,
        });

    const validate = ajv.compile(schema);
    const isValid = validate(req.body);
    //Si no es valido devolvemos err 400
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`SELECT setEmpleado( "${nombre}", "${apellido}", "${dni}", "${correo}", "${telefono}", "${img}", "${ubicacion}", "${cv}", "${hash}" ) AS consulta`)

    if (fetch.consulta === "REGISTRO CREADO") {
        return res.send(true);
    } else {
        return res.send(false);
    }
});

//Login
empleado.post("/login", upload.none(), async (req, res) => {

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
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`CALL logEmpleado("${correo}", "${hash}" )`, true);

    if (fetch.consulta === "Contraseña incorrecta") {
        return res.send(false);
    }
    else {
        const accessToken = generateAccessToken({ id: fetch.id_empleado, empleado: true });
        res.header('authorization', accessToken);
        return res.send(true);

    }
});


// ------------------------------------MIDDLEWARE----------------------------------------- 
//Session 
empleado.use(async (req, res, next) => {
    jwt = await validateToken(req, res, next);
    console.log(jwt);
    next();
});

// ------------------------------------GET-----------------------------------------
//GET
empleado.get("/get", async (req, res) => {
    const fetch = await runQuery(`CALL getEmpleado (${jwt.id}) `, true)
    res.send(fetch);
});

// ------------------------------------GET-----------------------------------------
//GET
empleado.get("/get/:id", async (req, res) => {
    const fetch = await runQuery(`CALL getEmpleado (${req.params.id}) `, true)
    res.send(fetch);
});

//GETALL
empleado.get("/getAll", async (req, res) => {
    //Hay que cambiar el procedure para que haga un join con las cosas de experiencia y estudios, pero solo el titulo y/o promedio, ademas un LIMIT 1
    const fetch = await runQuery(`CALL getEmpleado (0)`);
    res.send(fetch);
});

// ------------------------------------UPDATE-----------------------------------------
empleado.patch("/update", upload.none(), async (req, res) => {

    const { nombre, apellido, dni, correo, telefono, img, ubicacion, cv, hash } = req.body;
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
        dni: Type.String({
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
        telefono: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        img: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        ubicacion: Type.String({
            errorMessage: {
                type: "Debe ser un String"
            }
        }),
        cv: Type.String({
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
            additionalProperties: false,
        });

    const validate = ajv.compile(schema);

    const isValid = validate(req.body);

    //Si no es valido devolvemos err 400    
    if (!isValid) return res.status(400).send(validate.errors);

    const fetch = await runQuery(`SELECT updateEmpleado( ${jwt.id},"${nombre}", "${apellido}", "${dni}", "${correo}", "${telefono}", "${img}", "${ubicacion}", "${cv}", "${hash}" ) AS consulta`)

    if (fetch.consulta === "REGISTRO ACTUALIZADO") {
        return res.send(true);
    } else {
        return res.send(fetch.consulta);
    }

});


// ------------------------------------DELETE-----------------------------------------
empleado.delete("/delete", async (req, res) => {
    const fetch = await runQuery(`SELECT deleteEmpleado(${jwt.id}) AS consulta`);
    console.log(fetch);
    if (fetch.consulta == false) return res.send(false);
    res.send(true);
    //jwt destroy en front, eliminando del localStorage ademas

});
export default empleado;
