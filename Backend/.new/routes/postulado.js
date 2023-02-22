import express from "express";

import runQuery from "../helper/connect.js";
import { validateToken } from "../helper/validateToken.js";


const postulado = express.Router();
let jwt;


// ------------------------------------MIDDLEWARE-----------------------------------------
//Session
postulado.use(async (req, res, next) => {
    jwt = await validateToken(req, res, next);
    console.log(jwt);
    next();
})

// ------------------------------------GET-----------------------------------------


//Get Postulado
postulado.get("/get/:flag", async (req, res) => {

    let { flag } = req.params;

    //If flag = 1 significa que es empleado  flag = 0 es empleador
/*
    if (flag === 1) {
        const fetch = await runQuery(`CALL getPostulados(${jwt.id},1,0)`);
        return res.send(fetch);
    } else if (flag === 0) {
        const fetch = await runQuery(`CALL getPostulados(${jwt.id},0,1)`);
        return res.send(fetch);
    } else {
        return res.send(fetch.consulta);
    }*/
    const fetch = await runQuery(`CALL getPostulados(${jwt.id},1,0)`);
    res.send(fetch);
});


//Get Postulado
postulado.get("/validar/:id", async (req, res) => {
    const fetch = await runQuery(`SELECT validarPostulados(${req.params.id},${jwt.id}) AS consulta`);
    if (fetch.consulta !== 1) return res.send(false);
    res.send(true);
});
// -
// ------------------------------------INSERT-----------------------------------------

//Insert Postulado
postulado.post("/insert/:id", async (req, res) => {

    const { vacante } = req.body;
    console.log(req.body);
    const fetch = await runQuery(`SELECT setPostulados(${req.params.id},${jwt.id}) AS consulta`);
    if (fetch.consulta !== "REGISTRO CREADO") return res.send(false);
    res.send(true);

});

// ------------------------------------UPDATE-----------------------------------------



// ------------------------------------DELETE-----------------------------------------

//Delete Postulado
postulado.delete("/delete/:id", async (req, res) => {
    const fetch = await runQuery(`SELECT deletePostulados(${req.params.id}) AS consulta`);
    if (fetch.consulta !== 1) return res.send(false);
    res.send(true);
});

export default postulado;
