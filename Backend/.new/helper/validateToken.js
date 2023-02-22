import jwt from "jsonwebtoken";

const validateToken = (req, res, next) => {
    const accessToken = req.headers['authorization'];
    if (!accessToken) return res.send({ err: "usuario no autenticado" });

    return new Promise(resolve => {
        jwt.verify(accessToken, process.env.SECRET, (err, resp) => {
            if (err) return res.send({ err: "Error durante la autenticacion" });
            resolve(resp);
        })
    })
}

const generateAccessToken = (data) => {
    return jwt.sign(data, process.env.SECRET, { expiresIn: "1h" });
}


export { validateToken, generateAccessToken };