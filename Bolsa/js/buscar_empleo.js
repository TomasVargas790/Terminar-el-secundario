//Si no hay nada en el localStorage, directamente te rebota a la vista de error
if (!localStorage.authorization) window.location.replace("error.html");

const fetchCosas = async () => {
  const options = {
    method: "GET",
    headers: {
      authorization: localStorage.getItem("authorization"),
    }
  };

  const vacante = await (await fetch("http://localhost:3000/vacante/getAll", options)).json();
  if (vacante.err === "Error durante la autenticacion" || vacante.err === "usuario no autenticado");

  let boxContainer = document.getElementById("box-container");

  let cerrarSession = document.getElementById('cerrar-session');

  //Prendo el eventListener en el boton de cerrar sesion(empleado)
  cerrarSession.addEventListener("click", (e) => {
    e.preventDefault();

    localStorage.removeItem("authorization");
    window.location.replace("../index.html");
  });
  console.log(vacante);

  for (let i = 0; i < vacante.length; i++) {
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

    box__boton.setAttribute("href", "./ver_vacante.html?id=" + vacante[i].id_vacante);
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

    box__titulo.innerText = vacante[i].vacante_titulo;
    box__descripcion.innerText = vacante[i].vacante_descripcion;

    box__texto.appendChild(box__titulo);
    box__texto.appendChild(box__descripcion);

    box.appendChild(box__img);
    box.appendChild(box__texto);
    box.appendChild(box__boton);

    boxContainer.appendChild(box);

  }


};
fetchCosas();


