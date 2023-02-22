let ajax = new XMLHttpRequest;
ajax.onreadystatechange = function () {
    if (ajax.readyState === 4 && ajax.status === 200) {
        let datos = JSON.parse(ajax.responseText);
        if (datos.consulta == 0 || datos == false || datos.consulta == "0") {

            window.location.replace("error.html");
        } else {

            let vacante = document.getElementById("vacante")
            //Vacante
            vacante.onsubmit = function (e) {
                e.preventDefault();

                //Construccion de Json
                let titulo = document.getElementById('titulo').value;
                let descripcion = document.getElementById('descripcion').value;
                let salario = parseFloat(document.getElementById('salario').value);
                let cantidad = parseInt(document.getElementById('cantidad').value);
                let ubicacion = document.getElementById('ubicacion').value;
                let requisitos = document.getElementById('requisitos').value;
                let empresa = localStorage.empresa;

                let array = JSON.stringify({ "titulo": titulo, "descripcion": descripcion, "salario": salario, "cantidad": cantidad, "ubicacion": ubicacion, "requisitos": requisitos, "empresa": empresa });
                //AJAX
                let ajax1 = new XMLHttpRequest;
                ajax1.onreadystatechange = function () {
                    if (ajax1.readyState === 4 && (ajax1.status === 200 || ajax1.status === 201)) {
                        let datos1 = JSON.parse(ajax1.responseText);
                        if (datos1.consulta == "Vacante creada con exito") {
                            alert(datos1.consulta);
                            window.location.reload();
                        } else {
                            alert(datos1.consulta);
                        }
                    }
                }
                ajax1.open("POST", "http://localhost/bolsa/Bolsa-BK/index.php?class=vacante&action=insertar", true);
                ajax1.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                ajax1.send("json=" + array);
            }

            //Navbar
            let nav_ul=document.getElementById('nav_ul');
            let buscar_li = document.createElement('li');
            buscar_li.classList.add("nav__li");
            let buscarEmpleado = document.createElement('a');
            let buscar_texto = document.createTextNode("Buscar Empleado");
            buscarEmpleado.setAttribute('href', 'buscar_empleado.html');
            buscarEmpleado.appendChild(buscar_texto);
            buscar_li.appendChild(buscarEmpleado);
            nav_ul.appendChild(buscar_li);

            let cerrarSession = document.getElementById('cerrar-sesion');
            cerrarSession.appendChild(document.createTextNode(localStorage.nombre))



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
        }
    }
}

let array = JSON.stringify({ "hash_session_empleador": localStorage.session });
ajax.open("POST", "http://localhost/bolsa/Bolsa-BK/index.php?class=sessionempleador&action=validar", true);
ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
ajax.send("json=" + array);