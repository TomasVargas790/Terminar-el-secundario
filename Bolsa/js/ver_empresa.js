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
    const empresa = await (await fetch("http://localhost:3000/empresa/get/" + params.id, options)).json();
    if (empresa.err === "Error durante la autenticacion" || empresa.err === "usuario no autenticado") return window.location.replace("error.html");

    console.log(empresa);

    const optionsVacante = {
        method: "GET",
        headers: {
            authorization: localStorage.getItem("authorization"),
        }
    };

    const vacante = await (await fetch("http://localhost:3000/vacante/getVacanteFromEmpresa/" + empresa.id_empresa, optionsVacante)).json();
    if (vacante.err === "Error durante la autenticacion" || vacante.err === "usuario no autenticado") return window.location.replace("error.html");


    
let cerrarSession = document.getElementById('cerrar-sesion');
    //Prendo el eventListener en el boton de cerrar sesion(empleado)
    cerrarSession.addEventListener("click", (e) => {
        e.preventDefault();

        localStorage.removeItem("authorization");
        window.location.replace("../index.html");
    });

    //--------------------------------------EMPRESA------------------------------------
    let empresa_img = document.getElementById('empresa-img');
    let empresa_titulo = document.getElementById('empresa-titulo');
    let empresa_rubro = document.getElementById('empresa-rubro');

    empresa_titulo.innerText = empresa.empresa_nombre;

    empresa_rubro.innerText = empresa.empresa_rubro;

    empresa_img.setAttribute('src', '../assets/empresario.jpg');
    empresa_img.setAttribute('width', '200px');


    // Box descripcion    
    let descripcion = document.getElementById('descripcion');
    descripcion.innerText = empresa.empresa_descripcion;

    //-------------------------------------------VACANTE---------------------------

    let box__vacante = document.getElementById("box__vacante");

    for (let i = 0; i < vacante.length; i++) {
        let divVacante = document.createElement('div');
        let tituloVacante = document.createElement('span');
        let boton = document.createElement('a');

        divVacante.classList.add('orange');
        divVacante.classList.add('lighten-3');
        divVacante.classList.add('vacante');

        boton.classList.add('right');

        tituloVacante.innerText = vacante[i].vacante_titulo;

        boton.innerText = "Ver Mas!";
        boton.setAttribute('href', './ver_vacante.html?id=' + vacante[i].id_vacante);

        divVacante.appendChild(tituloVacante);
        divVacante.appendChild(boton);
        box__vacante.appendChild(divVacante);
    }
}
fetchCosas();
