//Si no hay nada en el localStorage, directamente te rebota a la vista de error
if (!localStorage.authorization) {
  window.location.replace("error.html");
}
//Aca se valida si el que ingresa es un empleador

let cerrarSession = document.getElementById("cerrar-session");
let buscarEmpleo = document.getElementById("buscar-algo");
let estudiosForm = document.getElementById("estudiosForm");
let idiomaForm = document.getElementById("idiomaForm");
let experienciaForm = document.getElementById("experienciaForm");

const fetchCosas = async () => {
  //------------------------------------------------------------FETCHING-------------------------------------------------------------------

  //EMPLEADO
  const optionsEmpleado = {
    method: "GET",
    headers: {
      authorization: localStorage.getItem("authorization"),
    },
  };
  let empleado = await (await fetch("http://localhost:3000/empleado/get", optionsEmpleado)).json();
  if (empleado.err === "Error durante la autenticacion" || empleado.err === "usuario no autenticado") return window.location.replace("./error.html");

  //ESTUDIOS
  const optionsEstudios = {
    method: "GET",
    headers: {
      authorization: localStorage.getItem("authorization"),
    },
  };

  let estudios = await (await fetch("http://localhost:3000/estudios/get", optionsEstudios)).json();
  if (estudios.err === "Error durante la autenticacion" || estudios.err === "usuario no autenticado") return window.location.replace("./error.html");

  //EXPERIENCIA
  const optionsExperencia = {
    method: "GET",
    headers: {
      authorization: localStorage.getItem("authorization"),
    },
  };

  let experiencia = await (await fetch("http://localhost:3000/experiencia/get", optionsExperencia)).json();
  if (experiencia.err === "Error durante la autenticacion" || experiencia.err === "usuario no autenticado") return window.location.replace("./error.html");

  //IDIOMA
  const optionsIdioma = {
    method: "GET",
    headers: {
      authorization: localStorage.getItem("authorization"),
    },
  };

  let idioma = await (await fetch("http://localhost:3000/idioma/get", optionsIdioma)).json();
  if (idioma.err === "Error durante la autenticacion" || idioma.err === "usuario no autenticado") return window.location.replace("./error.html");

  //Postulados
  const optionsPostulados = {
    method: "GET",
    headers: {
      authorization: localStorage.getItem("authorization"),
    },
  };

  let postulados = await (await fetch("http://localhost:3000/postulado/get/1", optionsPostulados)).json();
  if (postulados.err === "Error durante la autenticacion" || postulados.err === "usuario no autenticado") return window.location.replace("./error.html");

  console.log(postulados);
  // ------------------------------------------------------------------------------CONSTRUCCION DE LA VISTA----------------------------------------------------------------
  //Navbar

  buscarEmpleo.innerText = "";
  buscarEmpleo.innerText = "Buscar Empleo";
  buscarEmpleo.setAttribute("href", "");
  buscarEmpleo.setAttribute("href", "buscar_empleo.html");

  //Title
  let title = document.getElementById("title");
  title.innerText = "";
  title.innerText = empleado.empleado_nombre;

  //Prendo el eventListener en el boton de cerrar sesion(empleado)
  cerrarSession.addEventListener("click", (e) => {
    e.preventDefault();

    localStorage.removeItem("authorization");
    window.location.replace("../index.html");
  });

  // Panel
  let panel = document.getElementById("panel");

  let panel__img = document.getElementById("img");
  let panel__titulo = document.getElementById("h5panel");
  let panel__subtitulo = document.getElementById("subh5panel");

  panel__img.setAttribute("src", "");
  panel__titulo.innerText = "";
  panel__subtitulo.innerText = "";

  panel__titulo.innerText = empleado.empleado_nombre;
  panel__subtitulo.innerText =
    estudios[0].estudios_titulo || empleado.empleado_apellido;
  panel__img.setAttribute("src", "../assets/estudiante.jpeg");


  // Box estudios(resumen)
  let box__estudios = document.getElementById("box__estudios");

  //Si no tiene le pongo este default
  if (estudios[0].consulta != "no") {
    document.getElementById("titulo-estudios").innerText = "";
    document.getElementById("titulo-estudios").innerText = estudios[0].estudios_titulo;

    let estudios__descripcion = document.createElement("h6");
    estudios__descripcion.innerText = estudios[0].estudios_descripcion;

    box__estudios.appendChild(estudios__descripcion);

    //---------------------------------------TAB ESTUDIO-------------------------------------------

    let ulEstudioTab = document.getElementById("ulEstudioTab");
    ulEstudioTab.innerHTML = "";

    for (let i = 0; i < estudios.length; i++) {
      let liEstudioTab = document.createElement("li");
      let collapsableHeader = document.createElement("div");
      let icon = document.createElement("i");
      let tituloHeader = document.createElement("h6");
      let tituloBHeader = document.createElement("b");
      let notaHeader = document.createElement('h6');

      let collapsableBody = document.createElement("div");
      let h6Body = document.createElement("h6");
      let spanBody = document.createElement('p');
      let fechaInicio = document.createElement('h6');
      let fechaFinalizacion = document.createElement('h6');
      let botonEliminar = document.createElement('a');
      let iconoEliminar = document.createElement('i');

      fechaInicio.innerText = 'Fecha de inicio: ' + estudios[i].estudios_fecha_inicio;
      fechaFinalizacion.innerText = 'Fecha de finalizacion: ' + estudios[i].estudios_fecha_fin;

      h6Body.innerText = estudios[i].estudios_titulo;
      spanBody.innerText = 'Descripcion: ' + estudios[i].estudios_descripcion;

      iconoEliminar.classList.add('material-icons');
      botonEliminar.classList.add('btn');
      botonEliminar.classList.add('red');
      botonEliminar.classList.add('deleteBotonEstudios');
      botonEliminar.setAttribute('id_estudios', estudios[i].id_estudios);
      botonEliminar.setAttribute('href', "#");
      iconoEliminar.classList.add('right');

      iconoEliminar.innerText = "delete";
      botonEliminar.innerText = "ELIMINAR";
      botonEliminar.appendChild(iconoEliminar);


      notaHeader.innerText = 'Promedio:' + estudios[i].estudios_promedio;
      tituloBHeader.innerText = estudios[i].estudios_titulo;
      tituloHeader.appendChild(tituloBHeader);
      icon.classList.add("material-icons");
      icon.innerText = "star";

      collapsableHeader.classList.add("collapsible-header");
      collapsableHeader.classList.add("orange");
      collapsableHeader.classList.add("lighten-2");



      collapsableBody.classList.add("collapsible-body");
      collapsableBody.classList.add("orange");
      collapsableBody.classList.add("lighten-4");

      collapsableBody.appendChild(h6Body);
      collapsableBody.appendChild(fechaInicio);
      collapsableBody.appendChild(fechaFinalizacion);
      collapsableBody.appendChild(spanBody);
      collapsableBody.appendChild(botonEliminar);

      collapsableHeader.appendChild(tituloHeader);
      collapsableHeader.appendChild(notaHeader);

      liEstudioTab.appendChild(collapsableHeader);
      liEstudioTab.appendChild(collapsableBody);

      ulEstudioTab.appendChild(liEstudioTab);
    }
  } else {
    let estudios__titulo = (document.getElementById(
      "titulo-estudios"
    ).innerText = "Completa tu perfil de estudios!");

    let boton = document.createElement("a");
  }

  // Box experiencia
  let box__experiencia = document.getElementById("box__experiencia");
  //Verifico si tiene experiencia
  if (experiencia[0].consulta != "no") {
    document.getElementById("titulo-experiencia").innerText =
      experiencia[0].experiencia_titulo;

    let experiencia__descripcion = document.createElement("h6");
    experiencia__descripcion.innerText = experiencia[0].experiencia_descripcion;

    box__experiencia.appendChild(experiencia__descripcion);

    //---------------------------------------TAB EXPERIENCIA-------------------------------------------

    let ulExperienciaTab = document.getElementById("ulExperienciaTab");
    ulExperienciaTab.innerHTML = "";

    for (let i = 0; i < experiencia.length; i++) {
      let liExperienciaTab = document.createElement("li");
      let collapsableHeader = document.createElement("div");
      let icon = document.createElement("i");
      let tituloHeader = document.createElement("h6");
      let tituloBHeader = document.createElement("b");
      let notaHeader = document.createElement('h6');

      let collapsableBody = document.createElement("div");
      let h6Body = document.createElement("h6");
      let spanBody = document.createElement('p');
      let fechaInicio = document.createElement('h6');
      let fechaFinalizacion = document.createElement('h6');
      let botonEliminar = document.createElement('a');
      let iconoEliminar = document.createElement('i');

      fechaInicio.innerText = 'Fecha de inicio: ' + experiencia[i].experiencia_fecha_inicio;
      fechaFinalizacion.innerText = 'Fecha de finalizacion: ' + experiencia[i].experiencia_fecha_fin;

      h6Body.innerText = experiencia[i].experiencia_titulo;
      spanBody.innerText = 'Descripcion: ' + experiencia[i].experiencia_descripcion;

      iconoEliminar.classList.add('material-icons');
      botonEliminar.classList.add('btn');
      botonEliminar.classList.add('red');
      botonEliminar.classList.add('deleteBotonExperiencia');
      botonEliminar.setAttribute('id_experiencia', experiencia[i].id_experiencia);
      botonEliminar.setAttribute('href', "#");
      iconoEliminar.classList.add('right');

      iconoEliminar.innerText = "delete";
      botonEliminar.innerText = "ELIMINAR";
      botonEliminar.appendChild(iconoEliminar);


      notaHeader.innerText = 'Puesto: ' + experiencia[i].experiencia_titulo;
      tituloBHeader.innerText = experiencia[i].experiencia_titulo;
      tituloHeader.appendChild(tituloBHeader);
      icon.classList.add("material-icons");
      icon.innerText = "star";

      collapsableHeader.classList.add("collapsible-header");
      collapsableHeader.classList.add("orange");
      collapsableHeader.classList.add("lighten-2");



      collapsableBody.classList.add("collapsible-body");
      collapsableBody.classList.add("orange");
      collapsableBody.classList.add("lighten-4");

      collapsableBody.appendChild(h6Body);
      collapsableBody.appendChild(fechaInicio);
      collapsableBody.appendChild(fechaFinalizacion);
      collapsableBody.appendChild(spanBody);
      collapsableBody.appendChild(botonEliminar);

      collapsableHeader.appendChild(tituloHeader);
      collapsableHeader.appendChild(notaHeader);

      liExperienciaTab.appendChild(collapsableHeader);
      liExperienciaTab.appendChild(collapsableBody);

      ulExperienciaTab.appendChild(liExperienciaTab);
    }

    //Si no tiene le pongo este default
  } else {
    document.getElementById("titulo-experiencia").innerText =
      "No cuenta con experiencia laboral!";
  }

  // Box idioma
  let box__idioma = document.getElementById("box__idioma");


  //Verifico si tiene idioma
  if (idioma[0].consulta != "no") {
    document.getElementById("titulo-idioma").innerText =
      idioma[0].idioma_idioma;

    let idioma__descripcion = document.createElement("h6");
    idioma__descripcion.innerText = idioma[0].idioma_nivel;

    box__idioma.appendChild(idioma__descripcion);

    //---------------------------------------TAB IDIOMA-------------------------------------------

    let ulIdiomaTab = document.getElementById("ulIdiomaTab");
    ulIdiomaTab.innerHTML = "";

    for (let i = 0; i < idioma.length; i++) {
      let liIdiomaTab = document.createElement("li");
      let collapsableHeader = document.createElement("div");
      let icon = document.createElement("i");
      let tituloHeader = document.createElement("h6");
      let tituloBHeader = document.createElement("b");
      let collapsableBody = document.createElement("div");
      let h6NivelBody = document.createElement("h6");
      
      let h6Body = document.createElement("h6");

      let botonEliminar = document.createElement('a');
      let iconoEliminar = document.createElement('i');
      iconoEliminar.classList.add('material-icons');
      botonEliminar.classList.add('btn');
      botonEliminar.classList.add('red');
      botonEliminar.classList.add('deleteBotonIdioma');
      botonEliminar.setAttribute('id_idioma', idioma  [i].id_idioma);
      botonEliminar.setAttribute('href', "#");
      iconoEliminar.classList.add('right');

      iconoEliminar.innerText = "delete";
      botonEliminar.innerText = "ELIMINAR";
      botonEliminar.appendChild(iconoEliminar);
      h6Body.innerText = idioma[i].idioma_idioma;
      collapsableBody.classList.add("collapsible-body");
      collapsableBody.appendChild(h6Body);
      collapsableBody.appendChild(h6NivelBody);
      collapsableBody.appendChild(botonEliminar);

      h6NivelBody.innerText=idioma[i].idioma_nivel
      tituloBHeader.innerText = idioma[i].idioma_idioma;
      tituloHeader.appendChild(tituloBHeader);
      icon.classList.add("material-icons");
      icon.innerText = "star";

      collapsableHeader.classList.add("collapsible-header");
      collapsableHeader.classList.add("orange");
      collapsableHeader.classList.add("lighten-2");
      collapsableHeader.appendChild(icon);
      collapsableHeader.appendChild(tituloHeader);

      liIdiomaTab.appendChild(collapsableHeader);
      liIdiomaTab.appendChild(collapsableBody);

      ulIdiomaTab.appendChild(liIdiomaTab);
    }

    //Si no tiene le pongo este default
  } else {
    document.getElementById("titulo-idioma").innerText =
      "Solo idioma nativo!: Español";
  }

  // ------------------------------------------------------POSTULADOS------------------------------------------

  let postuladosTabla = document.getElementById('postuladosTabla');
  postuladosTabla.innerHTML = "";

  for (let i = 0; i < postulados.length; i++) {

    let tr = document.createElement('tr');
    let tdTitulo = document.createElement('td');
    let tdEmpresa = document.createElement('td');
    let tdFecha = document.createElement('td');
    let tdBoton = document.createElement('td');

    let botonA = document.createElement('a');
    let icono = document.createElement('i');

    botonA.classList.add('red');
    botonA.classList.add('btn');
    botonA.classList.add('deleteBoton');
    icono.classList.add('material-icons');
    icono.innerText = 'delete';

    botonA.setAttribute('id_postulado', postulados[i].id_postulados);


    tdBoton.appendChild(botonA);
    botonA.appendChild(icono);
    tdTitulo.innerText = postulados[i].vacante_titulo;
    tdEmpresa.innerText = postulados[i].empresa_nombre;
    tdFecha.innerText = postulados[i].postulados_alta;


    tr.appendChild(tdTitulo);
    tr.appendChild(tdEmpresa);
    tr.appendChild(tdFecha);
    tr.appendChild(tdBoton);

    postuladosTabla.appendChild(tr);
  }

  let deleteBoton = document.querySelectorAll('.deleteBoton')
  for (let i = 0; i < deleteBoton.length; i++) {
    deleteBoton[i].addEventListener('click', async (e) => {
      e.preventDefault();
      let id = deleteBoton[i].getAttribute('id_estudios');

      console.log(id);
      const opt = {
        method: 'DELETE',
        headers: {
          'authorization': localStorage.getItem("authorization"),
        },
      };

      let deletePostulados = await (await fetch("http://localhost:3000/postulado/delete/" + id, opt)).json();
      if (deletePostulados.err === "Error durante la autenticacion" || deletePostulados.err === "usuario no autenticado") return window.location.replace("./error.html");
      if (deletePostulados !== true) alert('Algo salio mal');
      fetchCosas();
    })
  }

  let deleteBotonEstudios = document.querySelectorAll('.deleteBotonEstudios');
  for (let i = 0; i < deleteBotonEstudios.length; i++) {
    deleteBotonEstudios[i].addEventListener('click', async (e) => {
      e.preventDefault();
      let id = deleteBotonEstudios[i].getAttribute('id_estudios');

      console.log(id);
      const opt = {
        method: 'DELETE',
        headers: {
          'authorization': localStorage.getItem("authorization"),
        },
      };

      let deleteEstudios = await (await fetch("http://localhost:3000/estudios/delete/" + id, opt)).json();
      if (deleteEstudios.err === "Error durante la autenticacion" || deleteEstudios.err === "usuario no autenticado") return window.location.replace("./error.html");
      if (deleteEstudios !== true) alert('Algo salio mal');
      fetchCosas();
    })
  }
  let deleteBotonExperiencia = document.querySelectorAll('.deleteBotonExperiencia');
  for (let i = 0; i < deleteBotonExperiencia.length; i++) {
    deleteBotonExperiencia[i].addEventListener('click', async (e) => {
      e.preventDefault();
      let id = deleteBotonExperiencia[i].getAttribute('id_experiencia');

      console.log(id);
      const opt = {
        method: 'DELETE',
        headers: {
          'authorization': localStorage.getItem("authorization"),
        },
      };

      let deleteExperiencia = await (await fetch("http://localhost:3000/experiencia/delete/" + id, opt)).json();
      if (deleteExperiencia.err === "Error durante la autenticacion" || deleteExperiencia.err === "usuario no autenticado") return window.location.replace("./error.html");
      if (deleteExperiencia !== true) alert('Algo salio mal');
      fetchCosas();
    })
  }
  let deleteBotonIdioma = document.querySelectorAll('.deleteBotonIdioma');
  for (let i = 0; i < deleteBotonIdioma.length; i++) {
    deleteBotonIdioma[i].addEventListener('click', async (e) => {
      e.preventDefault();
      let id = deleteBotonIdioma[i].getAttribute('id_idioma');

      console.log(id);
      const opt = {
        method: 'DELETE',
        headers: {
          'authorization': localStorage.getItem("authorization"),
        },
      };

      let deleteIdioma = await (await fetch("http://localhost:3000/idioma/delete/" + id, opt)).json();
      if (deleteIdioma.err === "Error durante la autenticacion" || deleteIdioma.err === "usuario no autenticado") return window.location.replace("./error.html");
      if (deleteIdioma !== true) alert('Algo salio mal');
      fetchCosas();
    })
  }



};



fetchCosas();

estudiosForm.addEventListener("submit", async (e) => {
  e.preventDefault();
  let formData = new FormData(estudiosForm);

  const options = {
    method: "POST",
    headers: {
      authorization: localStorage.getItem("authorization"),
    },
    body: formData,
  };

  try {
    let fetched = await fetch("http://localhost:3000/estudios/insert", options);
    fetched = await fetched.json();
    if (fetched !== true) return console.error(fetched);
    fetchCosas();
  } catch (err) {
    console.error(err);
  }
});
idiomaForm.addEventListener("submit", async (e) => {
  e.preventDefault();
  let formData = new FormData(idiomaForm);

  const options = {
    method: "POST",
    headers: {
      authorization: localStorage.getItem("authorization"),
    },
    body: formData,
  };

  try {
    let fetched = await fetch("http://localhost:3000/idioma/insert", options);
    fetched = await fetched.json();
    if (fetched !== true) return console.error(fetched);
    fetchCosas();
  } catch (err) {
    console.error(err);
  }
});
experienciaForm.addEventListener("submit", async (e) => {
  e.preventDefault();
  let formData = new FormData(experienciaForm);

  const options = {
    method: "POST",
    headers: {
      authorization: localStorage.getItem("authorization"),
    },
    body: formData,
  };

  try {
    let fetched = await fetch(
      "http://localhost:3000/experiencia/insert",
      options
    );
    fetched = await fetched.json();
    if (fetched !== true) return console.error(fetched);
    fetchCosas();
  } catch (err) {
    console.error(err);
  }
});
//document.addEventListener("click",fetchCosas());

/*
let ajax = new XMLHttpRequest;
ajax.onreadystatechange = function () {
    if (ajax.readyState === 4 && ajax.status === 200) {
        let datos = JSON.parse(ajax.responseText);
        if (datos.consulta == 0 || datos == false || datos.consulta == "0") {

            //Si no es empleador(ya que la function devolvio 0),se asume 
            //que es empleado, asi que se verifica que la sesion sea valida
            let ajax1 = new XMLHttpRequest;
            ajax1.onreadystatechange = function () {
                if (ajax1.readyState === 4 && ajax1.status === 200) {
                    let datos1 = JSON.parse(ajax1.responseText);

                    //Si la sesion es valida, devolvera la id del empleado,
                    //asi que si no es ni 0 ni false, tiene que ser valida
                    if (datos1 != 0 && datos1 != false) {

                        //Una vez validada la sesion se peticionan los datos del empleado en cuestion
                        let ajax2 = new XMLHttpRequest;
                        ajax2.onreadystatechange = function () {
                            if (ajax2.readyState === 4 && ajax2.status === 200) {

                                let datos2 = JSON.parse(ajax2.responseText);
                                //Si algo sale mal en este punto se envia a error.html
                                if (datos2 == false) {
                                    window.location.replace('../views/error.html');
                                } else {
                                    //Separo datos en 4 objetos individuales
                                    let empleado = datos2.empleado;
                                    let experiencia = datos2.experiencia;
                                    let q = datos2.estudios;
                                    let idioma = datos2.idioma;
                                    //en el caso que devuelva algo distinto a false, verifico que por segunda vez

                                    if (empleado.consulta == "no") {
                                        window.location.replace('../views/error.html');
                                    } else {
                                        
                        }
                        //Envio AJAX(traer los datos del empleado)
                        ajax2.open("GET", "http://localhost/bolsa/Bolsa-BK/index.php?class=empleado&action=obtener&id=" + datos1.consulta);
                        ajax2.send();
                    }
                }
            }
            let array = JSON.stringify({ "hash_session": localStorage.session });
            //Envio AJAX(validar la sesion empleado)
            ajax1.open("POST", "http://localhost/bolsa/Bolsa-BK/index.php?class=session&action=validar", true);
            ajax1.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
            ajax1.send("json=" + array);

            //En cambio, si el resultado de la primera verificacion de sesion no es 0 o false,
            //empiezo la construccion de la vista de empleador
        } else {

            //Una vez validada la sesion se peticionan los datos del empleado en cuestion
            let ajax1 = new XMLHttpRequest;
            ajax1.onreadystatechange = function () {
                if (ajax1.readyState === 4 && ajax1.status === 200) {

                    let datos1 = JSON.parse(ajax1.responseText);
                    //Si algo sale mal en este punto se envia a error.html
                    console.log(datos1)
                    if (datos1 == false) {
                        window.location.replace('../views/error.html');
                    } else {
                        //Separo datos en 4 objetos individuales
                        let empleado = datos1.empleado;
                        let experiencia = datos1.experiencia;
                        let estudios = datos1.estudios;
                        let idioma = datos1.idioma;
                        //en el caso que devuelva algo distinto a false, verifico que por segunda vez

                        if (empleado.consulta == "no") {
                            window.location.replace('../views/error.html');
                        } else {
                            //CONSTRUCCION DE LA VISTA    

                            let cerrarSession = document.getElementById("cerrar-session");
                            let buscarEmpleo = document.getElementById("buscar-algo");
                            //Title
                            let title = document.getElementById('title');
                            let title__texto = document.createTextNode(empleado.empleado_nombre);
                            title.appendChild(title__texto);

                            //Navbar
                            let buscar_texto = document.createTextNode("Buscar Empleado");
                            buscarEmpleo.setAttribute('href', 'buscar_empleado.html');
                            buscarEmpleo.appendChild(buscar_texto);

                            //Cerrar sesion boton
                            let sesion__texto = document.createTextNode(empleado.empleado_nombre);
                            cerrarSession.appendChild(sesion__texto);

                            // Panel
                            let panel = document.getElementById('panel');

                            let panel__img = document.createElement('img');
                            let panel__texto = document.createElement('div');
                            let panel__titulo = document.createElement('h1');
                            let panel__subtitulo = document.createElement('p');


                            panel__img.classList.add("panel__img");
                            panel__texto.classList.add("panel__texto");
                            panel__titulo.classList.add("panel__titulo");
                            panel__subtitulo.classList.add("panel__subtitulo");

                            let titulo = document.createTextNode(empleado.empleado_nombre);
                            let descripcion = document.createTextNode(estudios[0].estudios_titulo || empleado.empleado_apellido);


                            panel__titulo.appendChild(titulo);
                            panel__subtitulo.appendChild(descripcion);

                            panel__img.setAttribute('src', '../assets/estudiante.jpeg');

                            panel__texto.appendChild(panel__titulo);
                            panel__texto.appendChild(panel__subtitulo);

                            panel.appendChild(panel__img);
                            panel.appendChild(panel__texto);

                            //Verifico si tiene estudios
                            // Box estudios
                            let box__estudios = document.getElementById('box__estudios');

                            let estudios__titulo = document.createElement('h2');
                            let estudios__descripcion = document.createElement('p');

                            estudios__titulo.classList.add('box__titulo');
                            estudios__descripcion.classList.add('box__descripcion');
                            //Si no tiene le pongo este default
                            if (estudios[0].consulta != "no") {
                                let estudios__h2 = document.createTextNode(estudios[0].estudios_titulo);
                                let estudios__p = document.createTextNode(estudios[0].estudios_descripcion);

                                estudios__titulo.appendChild(estudios__h2);
                                estudios__descripcion.appendChild(estudios__p);

                                box__estudios.appendChild(estudios__titulo);
                                box__estudios.appendChild(estudios__descripcion);

                            } else {
                                let estudios__h2 = document.createTextNode("Solo estudios primarios");

                                estudios__titulo.appendChild(estudios__h2);

                                box__estudios.appendChild(estudios__titulo);
                            }

                            // Box experiencia
                            let box__experiencia = document.getElementById('box__experiencia');

                            let experiencia__titulo = document.createElement('h2');
                            let experiencia__descripcion = document.createElement('p');

                            experiencia__titulo.classList.add('box__titulo');
                            experiencia__descripcion.classList.add('box__descripcion');

                            //Verifico si tiene experiencia
                            if (experiencia[0].consulta != "no") {

                                let experiencia__h2 = document.createTextNode(experiencia[0].experiencia_titulo);
                                let experiencia__p = document.createTextNode(experiencia[0].experiencia_descripcion);

                                experiencia__titulo.appendChild(experiencia__h2);
                                experiencia__descripcion.appendChild(experiencia__p);

                                box__experiencia.appendChild(experiencia__titulo);
                                box__experiencia.appendChild(experiencia__descripcion);
                                //Si no tiene le pongo este default
                            } else {

                                let experiencia__h2 = document.createTextNode("No cuenta con experiencia laboraL, se su primer empleo!");

                                experiencia__titulo.appendChild(experiencia__h2);

                                box__experiencia.appendChild(experiencia__titulo);
                            }


                            // Box idioma
                            let box__idioma = document.getElementById('box__idioma');

                            let idioma__titulo = document.createElement('h2');
                            let idioma__descripcion = document.createElement('p');

                            idioma__titulo.classList.add('box__titulo');
                            idioma__descripcion.classList.add('box__descripcion');
                            //Verifico si tiene idioma
                            if (idioma[0].consulta != "no") {
                                let idioma__h2 = document.createTextNode(idioma[0].idioma_idioma);
                                let idioma__p = document.createTextNode(idioma[0].idioma_nivel);

                                idioma__titulo.appendChild(idioma__h2);
                                idioma__descripcion.appendChild(idioma__p);

                                box__idioma.appendChild(idioma__titulo);
                                box__idioma.appendChild(idioma__descripcion);
                                //Si no tiene le pongo este default
                            } else {

                                let idioma__h2 = document.createTextNode("Solo habla su idioma nativO");
                                idioma__titulo.appendChild(idioma__h2);
                                box__idioma.appendChild(idioma__titulo);

                            }

                            //Esta parte solo se va activar si la session es de empleador
                            let vacantes = document.createElement('select');
                            let postular = document.createElement('button');
                            postular.appendChild(document.createTextNode("POSTULAR"));

                            let ajax2 = new XMLHttpRequest;
                            ajax2.onreadystatechange = function () {
                                if (ajax2.readyState === 4 && ajax2.status === 200) {
                                    let datos2 = JSON.parse(ajax2.responseText);
                                    for (let datitos of datos2) {
                                        let option = document.createElement('option');
                                        option.setAttribute('value', datitos.id_vacante);
                                        let option_text = document.createTextNode(datitos.vacante_titulo);
                                        option.appendChild(option_text);
                                        vacantes.appendChild(option);
                                    }
                                    //Una vez que cargo la pagina, recien ahi se activa el eventListener

                                    postular.addEventListener("click", () => {
                                        let ajax3 = new XMLHttpRequest;
                                        ajax3.onreadystatechange = function () {
                                            if (ajax.readyState === 4 && ajax3.status === 200) {
                                                let datos3 = JSON.parse(ajax3.responseText);
                                                console.log(datos3);

                                            }
                                        }

                                        let array = JSON.stringify({ empleado: 2, vacante: vacantes.value });
                                        ajax3.open("POST", "http://localhost/bolsa/Bolsa-BK/index.php?class=postulados&action=insertar");
                                        ajax3.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                        ajax3.send("json=" + array);
                                    });

                                }
                            }
                            panel.appendChild(vacantes);
                            panel.appendChild(postular);
                            //Aca se va a peticionar las vacantes de la empresa mediante la id del empleador
                            ajax2.open("GET", "http://localhost/bolsa/Bolsa-BK/index.php?class=vacante&action=obtenertodo&id=1");
                            ajax2.send();

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
                                            window.location.replace("../index.html");
                                        }
                                    }
                                }
                                let array = JSON.stringify({ "hash_session": localStorage.session });

                                //Envio AJAX(cierre de sesion)
                                ajax2.open("POST", "http://localhost/bolsa/Bolsa-BK/index.php?class=session&action=cerrar", true);
                                ajax2.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                                ajax2.send("json=" + array);

                            });
                        }
                    }
                }
            }
            //Envio AJAX(obtener empelado)
            ajax1.open("GET", "http://localhost/bolsa/Bolsa-BK/index.php?class=empleado&action=obtener&id=" + window.location.search.slice(4), true);
            ajax1.send();
        }

    }
}
//Envio AJAX(validar session empleador)
let array = JSON.stringify({ "hash_session_empleador": localStorage.session });
ajax.open("POST", "http://localhost/bolsa/Bolsa-BK/index.php?class=sessionempleador&action=validar", true);
ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
ajax.send("json=" + array);
}*/
