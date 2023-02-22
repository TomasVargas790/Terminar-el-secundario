

//Si no hay nada en el localStorage, directamente te rebota a la vista de error
if (!localStorage.authorization) window.location.replace("error.html");

const fetchCosas = async () => {
    const options = {
        method: "GET",
        headers: {
            authorization: localStorage.getItem("authorization"),
        }
    };

    const empleado = await (await fetch("http://localhost:3000/empleado/getAll", options)).json();
    if (empleado.err === "Error durante la autenticacion" || empleado.err === "usuario no autenticado") return window.location.replace("./error.html");

    let boxContainer = document.getElementById("box-container");

    let cerrarSession = document.getElementById('cerrar-session');

    //Prendo el eventListener en el boton de cerrar sesion(empleado)
    cerrarSession.addEventListener("click", (e) => {
        e.preventDefault();

        localStorage.removeItem("authorization");
        window.location.replace("../index.html");
    });
    console.log(empleado);

    for (let i = 0; i < empleado.length; i++) {

        const options = {
            method: "GET",
            headers: {
                authorization: localStorage.getItem("authorization"),
            }
        };

        const estudios = await (await fetch("http://localhost:3000/estudios/get/" + empleado[i].id_empleado, options)).json();
        if (estudios.err === "Error durante la autenticacion" || estudios.err === "usuario no autenticado") return window.location.replace("./error.html");


        let box = document.createElement("div");

        let box__img = document.createElement("img");
        let box__texto = document.createElement("div");
        let box__titulo = document.createElement("h4");
        let box__descripcion = document.createElement("p");


        let box__boton = document.createElement("a");
        let boton_texto = document.createTextNode("enviar");
        box__boton.appendChild(boton_texto);

        box__img.setAttribute("src", "../assets/empresario.jpg");
        box__img.setAttribute("width", "100px");

        box__boton.setAttribute("href", "./ver_empleado.html?id=" + empleado[i].id_empleado);
        box__boton.classList.add('right');
        box__boton.classList.add('btn');

        box.classList.add("box");
        box.classList.add("orange");
        box.classList.add("lighten-2");

        box__texto.classList.add("inline-cosas");
        box__texto.classList.add("valign");
        box__texto.classList.add("wrapper");

        box__titulo.classList.add("center");

        box__img.classList.add("circle");
        box__img.classList.add("materialboxed");
        box__img.classList.add("responsive-img");

        box__titulo.innerText = empleado[i].empleado_nombre;
        for (let estudi of estudios) {
            if (estudi.estudios_titulo == undefined) {
                box__descripcion.innerText = "Solo estudios primarios";
            }else{

                box__descripcion.innerText = estudi.estudios_titulo;
            }
        }

        box__texto.appendChild(box__titulo);
        box__texto.appendChild(box__descripcion);

        box.appendChild(box__img);
        box.appendChild(box__texto);
        box.appendChild(box__boton);

        boxContainer.appendChild(box);

    }


};
fetchCosas();





/*
if (!localStorage.session) {
    window.location.replace("error.html");
} else {
    let ajax = new XMLHttpRequest;
    ajax.onreadystatechange = function () {
        if (ajax.readyState === 4 && ajax.status === 200) {
            let datos = JSON.parse(ajax.responseText);
            if (datos.consulta == 0 || datos == false || datos.consulta == "0") {
                window.location.replace("error.html");
            } else {

                let cerrarSession = document.getElementById('cerrar-sesion');
                console.log(cerrarSession);
                cerrarSession.appendChild(document.createTextNode(localStorage.nombre))

                //Navbar
                let nav_ul = document.getElementById('nav_ul');
                let buscar_li = document.createElement('li');
                buscar_li.classList.add("nav__li");
                let buscarEmpleado = document.createElement('a');
                let buscar_texto = document.createTextNode("Buscar Empleado");
                buscarEmpleado.setAttribute('href', 'buscar_empleado.html');
                buscarEmpleado.appendChild(buscar_texto);
                buscar_li.appendChild(buscarEmpleado);
                nav_ul.appendChild(buscar_li);

                //Prendo el eventListener en el boton de cerrar sesion(empleado)
                cerrarSession.addEventListener('click', (e) => {
                    e.preventDefault();

                    //AJAX(cierre de sesion)
                    let ajax2 = new XMLHttpRequest;
                    ajax2.onreadystatechange = function () {
                        if (ajax2.readyState === 4 && (ajax2.status === 200 || ajax2.status === 201)) {
                            let datos2 = JSON.parse(ajax2.responseText);
                            console.log(datos2);
                            if (datos2.consulta == true) {
                                localStorage.removeItem("session");
                                localStorage.removeItem("empresa");
                                window.location.replace("../index.html");
                            }
                        }
                    }
                    let array = JSON.stringify({ "hash_session": localStorage.session });

                    //Envio AJAX(cierre de sesion)
                    ajax2.open("POST", "http://localhost/bolsa/Bolsa-BK/index.php?class=sessionempleador&action=cerrar", true);
                    ajax2.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    ajax2.send("json=" + array);

                });
                let boxContainer = document.getElementById("box-container");


                boxContainer.classList.add("box-container");
                let ajax1 = new XMLHttpRequest;
                ajax1.onreadystatechange = function () {
                    if (ajax1.readyState === 4 && ajax1.status === 200) {
                        let datos1 = JSON.parse(ajax1.responseText);
                        console.log(datos1);
                        for (let i of datos1) {


                            let ajax2 = new XMLHttpRequest;
                            ajax2.onreadystatechange = function () {
                                if (ajax2.readyState === 4 && ajax2.status === 200) {
                                    let datos2 = JSON.parse(ajax2.responseText);

                                    console.log(datos2[0]);
                                    let titulo = document.createTextNode(i.empleado_nombre);
                                    let descripcion = document.createTextNode(datos2[0].estudios_titulo || datos2[0].consulta);
                                    let boton_texto = document.createTextNode("enviar");


                                    box__titulo.appendChild(titulo);
                                    box__descripcion.appendChild(descripcion);
                                    box__boton.appendChild(boton_texto);

                                    box__img.setAttribute('src', '../assets/estudiante.jpeg');
                                    box__boton.setAttribute('href', './perfil_empleado.html?id=' + i.id_empleado);


                                    box__texto.appendChild(box__titulo);
                                    box__texto.appendChild(box__descripcion);
                                    box__texto.appendChild(box__boton);

                                    box.appendChild(box__img);
                                    box.appendChild(box__texto);

                                    boxContainer.appendChild(box);
                                }
                            }
                            ajax2.open("GET", "http://localhost/bolsa/Bolsa-BK/index.php?class=estudios&action=obtener&id=" + parseInt(i.id_empleado), true);
                            ajax2.send();

                            let box = document.createElement('div');
                            let box__texto = document.createElement('div');
                            let box__titulo = document.createElement('h4');
                            let box__descripcion = document.createElement('p');
                            let box__img = document.createElement('img');
                            let box__boton = document.createElement('a');

                            box.classList.add("box");
                            box__texto.classList.add("box__texto");
                            box__titulo.classList.add("box__titulo");
                            box__descripcion.classList.add("box_descripcion");
                            box__img.classList.add("box__img");


                        }


                    }

                }
                ajax1.open("GET", "http://localhost/bolsa/Bolsa-BK/index.php?class=empleado&action=obtener&id=0", true);
                ajax1.send();


            }
        }
    }
    let array = JSON.stringify({ "hash_session_empleador": localStorage.session });
    ajax.open("POST", "http://localhost/bolsa/Bolsa-BK/index.php?class=sessionempleador&action=validar", true);
    ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    ajax.send("json=" + array);
}

*/