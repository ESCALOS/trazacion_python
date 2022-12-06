$(document).ready( function () {
    cargarTabla();
} );
let scanner;
let i = 0;
let camaraActiva = false;
let numero_de_la_camara = 0;
let recargar_tabla = true;
let modal = '#modalPallet';
let video = 'preview';
function escanearPallet(){
    modal = '#modalPallet';
    video = 'preview';
    activarCamara();
    
    scanner.addListener('scan',content => {
        scanner.stop().then(()=>{
            document.getElementById(video).outerHTML = document.getElementById(video).outerHTML;
            camaraActiva = false;
            document.getElementById('btn-escanear').removeAttribute('style');
            obtenerDatos(content);
        });
    });
}
function escanearRemontar(){
    modal = '#modalRemontar';
    video = 'preview_remontar';
    activarCamara();
    
    scanner.addListener('scan',content => {
        scanner.stop().then(()=>{
            document.getElementById(video).outerHTML = document.getElementById(video).outerHTML;
            camaraActiva = false;
        });
    });
}
function registrarPallet(){
    codigo = document.getElementById('codigo').value;
    dp = document.getElementById('dp').value;
    presentacion = document.getElementById('presentacion').value;
    variedad = document.getElementById('variedad').value;
    calibre = document.getElementById('calibre').value;
    categoria = document.getElementById('categoria').value;
    plu = document.getElementById('plu').value;
    detalle = [];
    for(let j = 0; j < i; j++){
        let guia = document.getElementById('guia'+j).value;
        let numero_de_cajas = document.getElementById('cajas'+j).value;
        let lote = document.getElementById('lote'+j).value;
        if(guia!= "" && numero_de_cajas != "" && numero_de_cajas != 0 && lote != ""){
            detalle.push([guia,numero_de_cajas,lote]);
        }
    }
    $.ajax({
        url : 'add_pallet/',
        data : { 
            csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val(),
            codigo : codigo,
            dp : dp,
            presentacion : presentacion,
            variedad : variedad,
            categoria : categoria,
            calibre : calibre,
            plu : plu,
            detalles:JSON.stringify(detalle)
        },
        type : 'POST',
        dataType : 'json',
        beforeSend: () => {
            pantallaCarga();
        },
        success : json => {
            if(json.success){
                obtenerCantidadCajas(codigo,presentacion);
            }
        },
        error : function(xhr, status) {
            console.log(xhr);
        },
        complete : function(xhr, status) {
            if(status == "success"){
                if(xhr.responseJSON.success){
                    Swal.fire({
                        position: 'top-end',
                        icon: xhr.responseJSON.icon,
                        title: xhr.responseJSON.message,
                        showConfirmButton: false,
                        timer: 1000
                      })
                }else{
                      Swal.fire(
                        xhr.responseJSON.message,
                        'No guardado',
                        xhr.responseJSON.icon,
                      )
                }
            }
        }
    });
}
function crearNuevoDetalle(){
    nuevoDetalle();
    i++;
}
function editarPallet(codigo){
    obtenerDatos(codigo);
    $("#modalPallet").modal("show");
}
function escanear(){
    modal = '#modalPallet';
    video = 'preview';
    document.getElementById('btn-escanear').setAttribute('style','display:none');
    document.getElementById('formulario').setAttribute('style','display:none');
    document.getElementById('camara').removeAttribute('style');
    resetearModal();
    escanearPallet();
}
function obtenerDatos(content){
    $.ajax({
        url : 'datos/',
        data : {
            codigo : content
        },
        type : 'GET',
        dataType : 'json',
        beforeSend: () => {
            Swal.fire({
                title: 'Cargando!',
                text: 'Espere un momento',
                imageUrl: "static/images/load.gif",
                imageWidth: 400,
                imageHeight: 200,
                imageAlt: 'Pantalla de carga',
                showConfirmButton: false,
              })
        },
        success : json => {
            document.getElementById('btn-escanear').removeAttribute('style');
            document.getElementById('camara').setAttribute('style','display:none');
            document.getElementById('formulario').removeAttribute('style');
            if(json.success){
                document.getElementById('modalTitle').textContent="Editar Pallet";
                obtenerCantidadCajas(json.pallet[0],json.pallet[2]);
                document.getElementById('codigo').value = json.pallet[0];
                document.getElementById('dp').value = json.pallet[1];
                document.getElementById('presentacion').value = json.pallet[2];
                document.getElementById('variedad').value = json.pallet[3];
                document.getElementById('calibre').value = json.pallet[4];
                document.getElementById('categoria').value = json.pallet[5];
                document.getElementById('plu').value = json.pallet[6];
                for(i = 0; i<json.detalle.length;i++){
                    nuevoDetalle();
                    document.getElementById('guia'+i).value = json.detalle[i].numero_de_guia; 
                    document.getElementById('cajas'+i).value = json.detalle[i].numero_de_cajas; 
                    document.getElementById('lote'+i).value = json.detalle[i].lote; 
                };
            }else{
                document.getElementById('modalTitle').textContent="Registrar Pallet";
                document.getElementById('codigo').value = content;
                mensajesCajas(0,0);
            }
        },
        error : function(xhr, status) {
            console.log(xhr);
        },

        complete : function(xhr, status) {
            if(xhr.responseJSON.success){
                ocultarAlerta();
            }else{
                Swal.fire({
                    position: 'top-end',
                    icon: status,
                    title: xhr.responseJSON.message,
                    showConfirmButton: false,
                    timer: 400
                })
            }
        }
    });
}
function obtenerCantidadCajas(codigo,presentacion){
    $.ajax({
        url : 'cantidad_cajas/',
        data : { 
            codigo : codigo,
            presentacion : presentacion
        },
        type : 'GET',
        dataType : 'json',
        success : json => {
            if(json.success){
                mensajesCajas(json.maximo_cajas,json.total_cajas);
            }
        },
        error : function(xhr, status) {
            console.log(xhr);
        },

        complete : function(xhr, status) {
            
        }
    });
}
function mensajesCajas(maximo_cajas,total_cajas){
    let cajas_restantes = maximo_cajas - total_cajas;
    if(maximo_cajas == 0){
        document.getElementById('cajas_restantes').removeAttribute('class');
        document.getElementById('cajas_restantes').textContent = "Detalle del Pallet";
    }else if(total_cajas == 0){
        document.getElementById('cajas_restantes').removeAttribute('class');
        document.getElementById('cajas_restantes').textContent = "Ninguna caja registrada";
    }else if(cajas_restantes < 0){
        document.getElementById('cajas_restantes').setAttribute('class','text-warning');
        document.getElementById('cajas_restantes').textContent = "Sobran " + (cajas_restantes*-1);
    }else if(cajas_restantes == 0){
        document.getElementById('cajas_restantes').setAttribute('class','text-success');
        document.getElementById('cajas_restantes').textContent = "Pallet Completo";
    }else{
        document.getElementById('cajas_restantes').setAttribute('class','text-danger');
        document.getElementById('cajas_restantes').textContent = "Faltan " + (cajas_restantes);
    }
}
function cargarTabla(){
    $.ajax({
        url: "tabla/",
        dataType: 'json',
        beforeSend: () => {
            pantallaCarga();
        },
        success : data => {
            $('#tabla_prueba').html(data.tabla);
            
            $('#table_id').DataTable({
                ordering: false,
                dom: 'frtip'
            });
        },
        error : (xhr,status) => {
            Swal.fire({
                icon: 'error',
                title: 'Ha ocurrido un error',
                text: 'Actualice la página',
              })
        },
        complete : (xhr,status) =>{
            document.getElementsByClassName("swal2-container")[0].style.display = "none";
        } 
    })
}
function resetearModal(){
    let rowDetalles = Array.prototype.slice.call(document.getElementsByClassName('rowDetalle'),0);
    i = 0;
    for(element of rowDetalles){
        element.remove();
    }
    document.getElementById('formulario').setAttribute('style','display:none');
    document.getElementById('camara').removeAttribute('style');
    document.getElementById('dp').value = "";
    document.getElementById('presentacion').value = "";
    document.getElementById('variedad').value = "";
    document.getElementById('categoria').value = "";
    document.getElementById('calibre').value = "";
}
function activarCamara(){
    scanner = new Instascan.Scanner({ 
        video: document.getElementById(video), 
        mirror:false,
        backgroundScan: false,
    });
    pantallaCarga();
    document.getElementById('modalTitle').textContent="Escanear Código";
    Instascan.Camera.getCameras().then(cameras => {
        if(cameras.length > 0){
            scanner.camera = cameras[numero_de_la_camara];
            scanner.start();
            scanner.addListener('active',()=>{
                camaraActiva = true;
                $(modal).modal('show');
                ocultarAlerta();
            });
        }else{
            Swal.fire(
                'Sin cámaras',
                'No se encontraron cámaras',
                'error',
                );
        }
    }).catch(e => {
        alert(e);
    });
}
function cambiarCamara(){
    scanner.stop().then(()=>{
        document.getElementById(video).outerHTML = document.getElementById(video).outerHTML;
        camaraActiva = false;
        recargar_tabla = false;
        $(modal).modal('hide');
        switch (numero_de_la_camara) {
            case 0:
                numero_de_la_camara = 1;
                break;
        
            default:
                numero_de_la_camara = 0;
                break;
        }
        video == 'preview' ? escanearPallet() : escanearRemontar();
    });
}
$('#modalPallet').on('hidden.bs.modal', function (event) {
    if(camaraActiva){
        scanner.stop().then(()=>{
            document.getElementById(video).outerHTML = document.getElementById(video).outerHTML;
            document.getElementById('btn-escanear').setAttribute('style','display:none');
            if(!recargar_tabla){
                recargar_tabla = true; 
            }else{
                cargarTabla();
                resetearModal();
            }
        });
    }
})

$('#modalRemontar').on('hidden.bs.modal', function (event) {
    if(camaraActiva){
        scanner.stop().then(()=>{
            document.getElementById(video).outerHTML = document.getElementById(video).outerHTML;
            camaraActiva = false;
        });
    }
})