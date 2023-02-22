

const fetchCosas = async () => {

    const fetchedEmpresa = await (await fetch("http://localhost:3000/empresa/getAll")).json();
    console.log(fetchedEmpresa);


    let selectEmpresa = document.getElementById('selectEmpresa');
    for (let i = 0; i < fetchedEmpresa.length; i++) {
        let empresaOpt = document.createElement('option');
        empresaOpt.value = fetchedEmpresa[i].id_empresa;
        empresaOpt.innerHTML = fetchedEmpresa[i].empresa_nombre;
        selectEmpresa.appendChild(empresaOpt);
    }
}


fetchCosas();

//Forms
let registerForm = document.getElementById('register');
let loginForm = document.getElementById('login');
let registerDiv = document.getElementById('registerDiv');
let loginDiv = document.getElementById('loginDiv');

//Empresa





//Register
registerForm.addEventListener('submit', async (e) => {
    e.preventDefault();
    const formRegister = new FormData(registerForm);
    const options = {
        method: "POST",
        body: formRegister
    }
    try {
        let fetched = await (await fetch('http://localhost:3000/empleador/register', options)).json();
        if (fetched !== true) {
            alert("algo sali mal");
            console.log(fetched);
            //window.location.reload();
        } else {
            console.log(fetched);
            boton[1].click();
        }
    } catch (error) {
        throw new Error("Algo no salio bien");
    }
});

//Login
loginForm.addEventListener('submit', async (e) => {
    e.preventDefault();
    const formLogin = new FormData(loginForm);
    const options = {
        method: "POST",
        body: formLogin
    };
    
    try {
        const fetched = await fetch('http://localhost:3000/empleador/login', options);
        
        if (await (fetched).json() !== true) {
            const divForm = document.querySelector(".inner__form");
            const span = document.createElement("span");
            span.innerText = "El correo o la contraseña son incorrectos";
            divForm.appendChild(span);
        } else {
            localStorage.setItem("authorization", fetched.headers.get("authorization"));
            window.location.replace("./perfil_empleador.html");
        }
        console.log(fetched);
    } catch (error) {
        throw new Error("Algo no salio bien");
    }
});





console.log(registerForm);
let boton = document.querySelectorAll('.inner__a');
boton[0].addEventListener('click', (e) => {
    e.preventDefault();
    registerDiv.classList.add('flex');
    registerDiv.classList.remove('hidden');
    loginDiv.classList.remove('flex');
    loginDiv.classList.add('hidden');
})
boton[1].addEventListener('click', (e) => {
    e.preventDefault();
    registerDiv.classList.remove('flex');
    registerDiv.classList.add('hidden');
    loginDiv.classList.remove('hidden');
    loginDiv.classList.add('flex');
})



/*
let ajax = new XMLHttpRequest;
ajax.onreadystatechange = function () {
    if (ajax.readyState === 4 && (ajax.status === 200 || ajax.status === 201)) {
        let datos = JSON.parse(ajax.responseText);
        console.log(datos);
        if (datos == false) {
            alert("algo salio mal");
        } else {
            let empresa = document.getElementById('empresa');
            for (let datitos of datos) {
                let option = document.createElement('option');
                let option_text = document.createTextNode(datitos.empresa_nombre);
                option.appendChild(option_text);
                option.setAttribute('value', datitos.id_empresa);
                empresa.appendChild(option);
            }



            //Register
            registerForm.onsubmit = function (e) {
                e.preventDefault();

                // JSON
                let nombre = document.getElementById('nombre').value;
                let apellido = document.getElementById('apellido').value;
                let correo = document.getElementById('correo').value;
                let dni = document.getElementById('dni').value;
                let telefono = document.getElementById('telefono').value;
                let empresa = document.getElementById('empresa').value;
                let hash = CryptoJS.MD5(document.getElementById('hash').value);
                let hash_session = CryptoJS.MD5(window.crypto.getRandomValues(new Uint32Array(1))[0].toString());
                let array = JSON.stringify({ "nombre": nombre, "apellido": apellido, "correo": correo, "documento": dni, "telefono": telefono, "empresa": empresa, "hash": hash.toString(), "hash_session": hash_session.toString() });
                let ajax = new XMLHttpRequest;

                //AJAX
                ajax.onreadystatechange = function () {
                    if (ajax.readyState === 4 && (ajax.status === 200 || ajax.status === 201)) {
                        let datos = JSON.parse(ajax.responseText);
                        console.log(datos)
                        if (datos.consulta == "empleado creado") {
                            //window.location.replace("perfil_empleado.html");
                        } else {
                            alert(datos.consulta);
                        }
                    }
                }
                ajax.open("POST", "http://localhost/bolsa/Bolsa-BK/index.php?class=empleador&action=insertar", true);
                ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                ajax.send("json=" + array);
            }

            //Login
            loginForm.onsubmit = function (e) {
                e.preventDefault();

                // JSON
                let login_correo = document.getElementById('login_correo').value;
                let login_hash = CryptoJS.MD5(document.getElementById('login_hash').value);
                let array = JSON.stringify({ "correo": login_correo, "hash": login_hash.toString() });

                //AJAX
                let ajax = new XMLHttpRequest;
                ajax.onreadystatechange = function () {
                    if (ajax.readyState === 4 && (ajax.status === 200 || ajax.status === 201)) {
                        let datos = JSON.parse(ajax.responseText);
                        console.log(datos);
                        if (datos !== false) {
                            if (datos.consulta != "NO SE ENCONTRO EL USUARIO" && datos.consulta != "Contraseña incorrecta") {

                                let ajax1 = new XMLHttpRequest;
                                ajax1.onreadystatechange = function () {
                                    if (ajax.readyState === 4 && (ajax1.status === 200 || ajax1.status === 201)) {
                                        let subdatos = JSON.parse(ajax1.responseText);
                                        console.log(subdatos)
                                        if (subdatos.consulta !== false) {
                                            localStorage.setItem("session", subdatos.consulta);
                                            localStorage.setItem("empresa", datos.empleador_empresa);
                                            localStorage.setItem("nombre", datos.empleador_nombre)
                                            window.location.replace("perfil_empresa.html");
                                        } else {
                                            window.location.replace("error.html");
                                        }
                                    }
                                }
                                let array = JSON.stringify({ "empleador_session": datos.id_empleador });
                                ajax1.open("POST", "http://localhost/bolsa/Bolsa-BK/index.php?class=sessionempleador&action=activar", true);
                                ajax1.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                ajax1.send("json=" + array);

                                //window.location.replace("perfil_empresa.html?id=" + datos.empleador_empresa);
                            } else {
                                alert(datos.consulta);
                            }
                        } else {
                            alert("Ha ocurrido un suseso");
                        }
                    }

                }
                ajax.open("POST", "http://localhost/bolsa/Bolsa-BK/index.php?class=empleador&action=login", true);
                ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                ajax.send("json=" + array);
            }
        }
    }
}
ajax.open("GET", "http://localhost/bolsa/Bolsa-BK/index.php?class=empresa&action=obtener&id=0");
ajax.send();



if (localStorage.session) {
    let ajax = new XMLHttpRequest;
    ajax.onreadystatechange = function () {
        if (ajax.readyState === 4 && (ajax.status === 200 || ajax.status === 201)) {
            let datos = JSON.parse(ajax.responseText);
            if (datos == 0 || datos == false) {
                window.location.replace("error.html");
            } else {
                window.location.replace("perfil_empresa.html");
            }
        }

    }
    let array = JSON.stringify({ "hash_session_empleador": localStorage.sesion });
    ajax.open("POST", "http://localhost/bolsa/Bolsa-BK/index.php?class=sessionempleador&action=validar");
    ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    ajax.send("json=" + array);
} else {

}


*/