import mysql from "mysql2";

// function definition
const runQuery = (sqlQuery, unique = false, debug = false) => {
    let config = mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "",
        database: "bolsa"
    });

    return new Promise((resolve, reject) => {
        console.log("START");
        if (config) {
            config.connect((err) => {
                if (err) throw err;
            });

            if (!debug) {
                config.query(sqlQuery, function (error, result, fields) {
                    if (error) {
                        throw error;
                    } else {
                        if (!unique) {
                            resolve(result[0]);
                        } else {
                            resolve(result[0][0]);
                        }
                    }

                    config.end(); 
                    config.destroy();
                });
            } else {
                config.query(sqlQuery, function (error, result, fields) {
                    config.end(); 
                    return resolve(error, result, fields, sqlQuery);

                });
            }
        } else {

        }

    });

}

export default runQuery;
/*
runQuery(`CALL getEmpleado(0)`,false,true)
    .then((a,b,c,d) => {
        console.log(a,b,c,d);
    });
*/

