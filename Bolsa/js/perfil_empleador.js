//Si no hay nada en el localStorage, directamente te rebota a la vista de error
if (!localStorage.authorization) window.location.replace("error.html");

const fetchCosas = async () => {

    const options = {
        method: 'GET',
        headers: {
            authorization: localStorage.getItem('authorization')
        }
    };
    const empleador = await (await fetch('http://localhost:3000/empleador/get', options)).json();
    if (empleador.err === "Error durante la autenticacion" || empleador.err === "usuario no autenticado") return window.location.replace("error.html");
    console.log(empleador);

    const optionsEmpresa = {
        method: 'GET',
        headers: {
            authorization: localStorage.getItem('authorization')
        }
    };

    const empresa = await (await fetch('http://localhost:3000/empresa/get/' + empleador.empleador_empresa, optionsEmpresa)).json();
    if (empresa.err === "Error durante la autenticacion" || empresa.err === "usuario no autenticado") return window.location.replace("error.html");

    const optionsVacante = {
        method: 'GET',
        headers: {
            authorization: localStorage.getItem('authorization')
        }
    };
    const vacante = await (await fetch('http://localhost:3000/vacante/getVacanteFromEmpresa/' + empleador.empleador_empresa, optionsVacante)).json();

    if (vacante.err === "Error durante la autenticacion" || vacante.err === "usuario no autenticado") return window.location.replace("error.html");

    const optionsPasantias = {
        method: 'GET',
        headers: {
            authorization: localStorage.getItem('authorization')
        }
    };
    const pasantias = await (await fetch('http://localhost:3000/pasantias/getPasantiasFromEmpresa/' + empleador.empleador_empresa, optionsPasantias)).json();
    if (pasantias.err === "Error durante la autenticacion" || pasantias.err === "usuario no autenticado") return window.location.replace("error.html");


    //Title
    let title = document.getElementById("title");
    title.innerText = "";
    title.innerText = empleador.empleador_nombre;


    //RESUMEN 

    //Empresa

    let descripcion = document.getElementById('titulo-empresa');
    descripcion.innerText = "";
    descripcion.innerText = empresa.empresa_descripcion;

    let tituloVacante = document.getElementById('titulo-vacante');
    tituloVacante.innerText = "";
    tituloVacante.innerText = vacante.length;

    
    let tituloPasantias = document.getElementById('titulo-pasantias');
    tituloPasantias.innerText = "";
    tituloPasantias.innerText = pasantias.length;





    // 
    let panel__img = document.getElementById("img");
    let panel__titulo = document.getElementById("h5panel");
    let panel__subtitulo = document.getElementById("subh5panel");

    panel__img.setAttribute("src", "");
    panel__titulo.innerText = "";
    panel__subtitulo.innerText = "";

    panel__titulo.innerText = empresa.empresa_nombre;
    panel__subtitulo.innerText = empresa.empresa_nombre;
    panel__img.setAttribute("src", "../assets/estudiante.jpeg");


    //Vacante 

    let ulVacanteTab = document.getElementById('ulVacanteTab');
    ulVacanteTab.innerHTML = "";

    for (let i = 0; i < vacante.length; i++) {
        let liVacanteTab = document.createElement("li");
        let collapsableHeader = document.createElement("div");
        let icon = document.createElement("i");
        let tituloHeader = document.createElement("h5");
        let tituloBHeader = document.createElement("b");
        let collapsableBody = document.createElement("div");
        let h5Body = document.createElement("h5");

        h5Body.innerText = vacante[i].vacante_titulo;
        collapsableBody.classList.add("collapsible-body");
        collapsableBody.appendChild(h5Body);

        tituloBHeader.innerText = vacante[i].vacante_titulo;
        tituloHeader.appendChild(tituloBHeader);
        icon.classList.add("material-icons");
        icon.innerText = "star";

        collapsableHeader.classList.add("collapsible-header");
        collapsableHeader.classList.add("orange");
        collapsableHeader.classList.add("lighten-2");
        collapsableHeader.appendChild(icon);
        collapsableHeader.appendChild(tituloHeader);

        liVacanteTab.appendChild(collapsableHeader);
        liVacanteTab.appendChild(collapsableBody);

        ulVacanteTab.appendChild(liVacanteTab);
    }



    //Pasantias 

    let ulPasantiasTab = document.getElementById('ulPasantiasTab');
    ulPasantiasTab.innerHTML = "";

    for (let i = 0; i < pasantias.length; i++) {
        let liPasantiasTab = document.createElement("li");
        let collapsableHeader = document.createElement("div");
        let icon = document.createElement("i");
        let tituloHeader = document.createElement("h5");
        let tituloBHeader = document.createElement("b");
        let collapsableBody = document.createElement("div");
        let h5Body = document.createElement("h5");

        h5Body.innerText = pasantias[i].pasantias_titulo;
        collapsableBody.classList.add("collapsible-body");
        collapsableBody.appendChild(h5Body);

        tituloBHeader.innerText = pasantias[i].pasantias_titulo;
        tituloHeader.appendChild(tituloBHeader);
        icon.classList.add("material-icons");
        icon.innerText = "star";

        collapsableHeader.classList.add("collapsible-header");
        collapsableHeader.classList.add("orange");
        collapsableHeader.classList.add("lighten-2");
        collapsableHeader.appendChild(icon);
        collapsableHeader.appendChild(tituloHeader);

        liPasantiasTab.appendChild(collapsableHeader);
        liPasantiasTab.appendChild(collapsableBody);

        ulPasantiasTab.appendChild(liPasantiasTab);
    }



}
fetchCosas();