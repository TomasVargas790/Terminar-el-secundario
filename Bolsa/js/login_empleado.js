
//getElements
let registerForm = document.getElementById('register');
let loginForm = document.getElementById('login');
let registerDiv = document.getElementById('registerDiv');
let loginDiv = document.getElementById('loginDiv');

//Register
registerForm.onsubmit = async function (e) {
    e.preventDefault();

    let formRegister = new FormData(registerForm);
    //const res = Object.fromEntries(formRegister);
    //const payload = JSON.stringify(res);

    try {
        let fetchedRegister = await fetch('http://localhost:3000/empleado/register',
            {
                method: 'POST',
                body: formRegister
            }
        );
        console.log(fetchedRegister);

    } catch (err) {
        throw new Error("No todo sale bien" + err);
    }

}

//Login
loginForm.onsubmit = async function (e) {
    e.preventDefault();

    const formLogin = new FormData(loginForm);

    const options = {
        method: 'POST'
    };

    options.body = formLogin;
    try {
        const fetched = await fetch('http://localhost:3000/empleado/login', options);
        if (await (fetched).json() !== true) {
            const divForm = document.querySelector(".inner__form");
            divForm.innerHTML="";
            const span = document.createElement("span");
            span.innerText = "El correo o la contraseña son incorrectos";
            divForm.appendChild(span);
        } else {
            localStorage.setItem("authorization", fetched.headers.get("authorization"));
            window.location.replace("./perfil_empleado.html");
        }
    } catch (err) {
        console.error(err);
    }
}

//Switch login-register
let boton = document.querySelectorAll('.inner__a');
boton[0].addEventListener('click', (e) => {
    e.preventDefault();
    registerDiv.classList.add('flex');
    registerDiv.classList.remove('hidden');
    loginDiv.classList.remove('flex');
    loginDiv.classList.add('hidden');
});
boton[1].addEventListener('click', (e) => {
    e.preventDefault();
    registerDiv.classList.remove('flex');
    registerDiv.classList.add('hidden');
    loginDiv.classList.remove('hidden');
    loginDiv.classList.add('flex');
});
