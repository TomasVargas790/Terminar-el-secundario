//Si no hay nada en el localStorage, directamente te rebota a la vista de error
if (!localStorage.authorization) window.location.replace("error.html");

let queryString = new URLSearchParams(window.location.search);
let params = Object.fromEntries(queryString);
console.log(params);

const fetchCosas = async () => {

    const options = {
        method: "GET",
        headers: {
            authorization: localStorage.getItem("authorization"),
        }
    };
    const vacante = await (await fetch("http://localhost:3000/vacante/get/" + params.id, options)).json();
    if (vacante.err === "Error durante la autenticacion" || vacante.err === "usuario no autenticado") return window.location.replace("error.html");

    console.log(vacante);

    const optionsEmpresa = {
        method: "GET",
        headers: {
            authorization: localStorage.getItem("authorization"),
        }
    };
    const empresa = await (await fetch("http://localhost:3000/empresa/get/" + vacante.vacante_empresa, optionsEmpresa)).json();
    if (empresa.err === "Error durante la autenticacion" || empresa.err === "usuario no autenticado") return window.location.replace("error.html");



    let cerrarSession = document.getElementById('cerrar-sesion');

    //Prendo el eventListener en el boton de cerrar sesion(empleado)
    cerrarSession.addEventListener("click", (e) => {
        e.preventDefault();

        localStorage.removeItem("authorization");
        window.location.replace("../index.html");
    });

    let empresa_img = document.getElementById('empresa-img');
    let empresa_titulo = document.getElementById('empresa-titulo');
    let empresa_rubro = document.getElementById('empresa-rubro');

    let empresa_redirect = document.getElementById('empresa-redirect')

    empresa_titulo.innerText = empresa.empresa_nombre;
    empresa_rubro.innerText = empresa.empresa_rubro;

    empresa_img.setAttribute('src', '../assets/empresario.jpg');
    empresa_img.setAttribute('width', '200px');


    empresa_redirect.setAttribute("href", "./ver_empresa.html?id=" + vacante.vacante_empresa);

    // Box puesto 
    let puesto_titulo = document.getElementById('puesto-titulo');
    let puesto_descripcion = document.getElementById('puesto-descripcion');

    puesto_titulo.innerText = vacante.vacante_titulo;
    puesto_descripcion.innerText = vacante.vacante_descripcion;


    // Box descripcion    
    let descripcion = document.getElementById('descripcion');
    descripcion.innerText = vacante.vacante_descripcion;

    //Box requisitos

    let requisitos = document.getElementById('requisitos');
    requisitos.innerText = vacante.vacante_requisitos;


    let botonPostular = document.getElementById('postular');

    const optionsValidar = {
        method: 'GET',
        headers: {
            'authorization': localStorage.getItem('authorization')
        },
    };



    let fetched = await (await fetch('http://localhost:3000/postulado/validar/' + vacante.id_vacante, optionsValidar)).json();
    if (fetched.err === "Error durante la autenticacion" || fetched.err === "usuario no autenticado") return window.location.replace("error.html");

    if (fetched !== true) {
        botonPostular.firstChild.innerText = "YA TE POSTULASTE!";
        botonPostular.setAttribute('disabled', 'disabled');
    } else {
        botonPostular.addEventListener('click', async (e) => {

            const options = {
                method: 'POST',
                headers: {
                    'authorization': localStorage.getItem('authorization'),
                    'Content-Type': 'multipart/form-data; boundary=---011000010111000001101001',
                },
            };

            let fetched = await (await fetch('http://localhost:3000/postulado/insert/' + vacante.id_vacante, options)).json();
            if (fetched.err === "Error durante la autenticacion" || fetched.err === "usuario no autenticado") return window.location.replace("error.html");


            botonPostular.firstChild.innerText = "YA TE POSTULASTE!";
            botonPostular.setAttribute('disabled', 'disabled');

        });
    }



}
fetchCosas();

