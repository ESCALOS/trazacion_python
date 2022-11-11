let scanner;
function activarCamara(){
scanner = new Instascan.Scanner({ video: document.getElementById('preview') });
Instascan.Camera.getCameras().then(cameras => {
    scanner.camera = cameras[cameras.length - 1];
    scanner.start();
    console.log("Hay "+cameras.length+" cámaras.");
}).catch(e => console.error(e));
scanner.addListener('scan', content => {
    scanner.stop();
    let cookie = document.cookie;
let csrfToken = cookie.substring(cookie.indexOf('=') + 1);
$.ajax({
    url : 'datos/',
    data : { 
    csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val(),
    codigo : content
    },
    type : 'POST',
    dataType : 'json',
    success : function(json) {
        console.log(json);
    },
    error : function(xhr, status) {
        alert('Disculpe, existió un problema');
        console.log(status);
    },

    // código a ejecutar sin importar si la petición falló o no
    complete : function(xhr, status) {
        alert('Petición realizada');
    }
});
});
}
function apagarCamara(){
scanner.stop();
scanner.addListener('inactive',() => {
    setTimeout(()=>{ alert('La cámara está apagada')},1000);
    
});
}
function obtenerDatos(){
let cookie = document.cookie;
let csrfToken = cookie.substring(cookie.indexOf('=') + 1);
$.ajax({
    url : 'datos/',
    data : { 
    csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val(),
    code : 123
    },
    type : 'POST',
    dataType : 'json',
    success : function(json) {
        console.log(json);
    },
    error : function(xhr, status) {
        alert('Disculpe, existió un problema');
        console.log(status);
    },

    // código a ejecutar sin importar si la petición falló o no
    complete : function(xhr, status) {
        alert('Petición realizada');
    }
});
}