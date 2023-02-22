let empresa = document.getElementById('registerForm');

registerForm.addEventListener('submit', async (e) => {
    e.preventDefault();
    let = new FormData(registerForm);

    const options = {
        method: "POST",
        body: form
    }
    try {
        let fetched = await (await fetch('http://localhost:3000/empresa/insert', options)).json();
        if (fetched !== true) {
            alert("algo sali mal");
            console.log(fetched);
            window.location.reload();
        } else {
            window.location.replace('../views/index.html');
        }
    } catch (error) {
        throw new Error("Algo no salio bien");
    }
})























/*
//Register
let register = document.getElementById('register');
register.onsubmit = function (e) {
    e.preventDefault();

    // JSON
    let nombre = document.getElementById('nombre').value;
    let cuit = document.getElementById('cuit').value;
    let rubro = document.getElementById('rubro').value;
    let descripcion = document.getElementById('descripcion').value;
    let ubicacion = document.getElementById('ubicacion').value;
    let correo = document.getElementById('correo').value;
    let img = document.getElementById('img').value;
    let telefono = document.getElementById('telefono').value;
    let array = JSON.stringify({ "nombre": nombre, "cuit": cuit, "rubro": rubro, "descripcion": descripcion, "ubicacion": ubicacion, "correo": correo, "img": img, "telefono": telefono, });
    let ajax = new XMLHttpRequest;

    //AJAX
    ajax.onreadystatechange = function () {
        if (ajax.readyState === 4 && (ajax.status === 200 || ajax.status === 201)) {
            let datos = JSON.parse(ajax.responseText);
            console.log(datos)
            if (datos == false) {
                alert("algo salio mal")
                window.location.reload();
            } else if (datos.consulta == "EMPRESA CREADA CON EXITO") {
                window.location.replace("login_empresa.html");
            }
        }
    }
    ajax.open("POST", "http://localhost/bolsa/Bolsa-BK/index.php?class=empresa&action=insertar", true);
    ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    ajax.send("json=" + array);
}
*/