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
let pallet_activo = "";
function escanearPallet(){
    $('#modalPallet').modal('show');
}
function escanearRemontar(){
    $('#modalRemontar').modal('show');
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
    resetearModal();
    obtenerDatos(codigo);
    $("#modalRegistro").modal("show");
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
            pantallaCarga();
        },
        success : json => {
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
                document.getElementById('codigo').value = content;
                mensajesCajas(0,0);
            }
            pallet_activo = content;
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
        document.getElementById('div-remontar').removeAttribute('style');
    }else if(total_cajas == 0){
        document.getElementById('cajas_restantes').removeAttribute('class');
        document.getElementById('cajas_restantes').textContent = "Ninguna caja registrada";
        document.getElementById('div-remontar').removeAttribute('style');
    }else if(cajas_restantes < 0){
        document.getElementById('cajas_restantes').setAttribute('class','text-warning');
        document.getElementById('cajas_restantes').textContent = "Sobran " + (cajas_restantes*-1);
        document.getElementById('div-remontar').removeAttribute('style');
    }else if(cajas_restantes == 0){
        document.getElementById('cajas_restantes').setAttribute('class','text-success');
        document.getElementById('cajas_restantes').textContent = "Pallet Completo";
        document.getElementById('div-remontar').style.display = "none";
    }else{
        document.getElementById('cajas_restantes').setAttribute('class','text-danger');
        document.getElementById('cajas_restantes').textContent = "Faltan " + (cajas_restantes);
        document.getElementById('div-remontar').removeAttribute('style');
    }
}
function verificarCajas(self){
    let presentacion = document.getElementById('presentacion').value;
    if(presentacion > 0){
        $.ajax({
            url : 'cantidad_cajas/',
            data : { 
                codigo : '',
                presentacion : presentacion
            },
            type : 'GET',
            dataType : 'json',
            success : json => {
                let total_cajas = 0;
                if(json.success){
                    for(let j = 0; j<i; j++){
                        total_cajas = total_cajas + parseInt(document.getElementById('cajas'+j).value);
                    }
                    if(total_cajas> json.maximo_cajas){
                        total_cajas = total_cajas - parseInt(self.value)
                        self.value = json.maximo_cajas - total_cajas;
                    }
                }
            },
            error : function(xhr, status) {
                console.log(xhr);
            },

            complete : function(xhr, status) {

            }
        });
    }else{
        Swal.fire({
            icon: 'warning',
            title: "Seleccione una presentación",
            showConfirmButton: false,
            timer: 850
          })
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
$('#modalRegistro').on('hidden.bs.modal', function (event) {
    if(!recargar_tabla){
        recargar_tabla = true; 
    }else{
        cargarTabla();
        resetearModal();
    }
    pallet_activo = "";
})
$('#modalPallet').on('hidden.bs.modal', function (event) {
    $('#codigo_pallet').val('');
})
$('#modalRemontar').on('hidden.bs.modal', function (event) {
    $('#codigo_remontar').val('');
})
$('#codigo_pallet').on('keypress',e=>{
    if (e.keyCode === 13 && !e.shiftKey) {
        let codigo_pallet = $('#codigo_pallet').val();
        e.preventDefault();
        $('#modalPallet').modal('hide');
        obtenerDatos(codigo_pallet);
        $('#modalRegistro').modal('show');
    }
});
$('#codigo_remontar').on('keypress',e=>{
    if (e.keyCode === 13 && !e.shiftKey) {
        let pallet_a_poner = pallet_activo;
        let pallet_a_sacar = $('#codigo_remontar').val();
        e.preventDefault();
        $.ajax({
            url : 'remontabilidad/',
            data : {
                codigo_pallet_para_poner : pallet_a_poner,
                codigo_pallet_para_sacar : pallet_a_sacar
            },
            type : 'GET',
            dataType : 'json',
            beforeSend: () => {
                pantallaCarga();
                $('#codigo_remontar').val('');
                $('#modalRemontar').modal('hide');
            },
            success : json => {
                if(json.success){
                    Swal.fire({
                        title: json.message,
                        showDenyButton: true,
                        confirmButtonText: 'Remontar',
                        denyButtonText: `Cancelar`,
                      }).then((result) => {
                        if (result.isConfirmed) {
                            $.ajax({
                                url : 'remontar/',
                                data : {
                                    pallet_para_poner : json.pallet_a_poner,
                                    pallet_para_sacar : json.pallet_a_sacar,
                                    csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val(),
                                    cajas : json.cajas
                                },
                                type : 'POST',
                                dataType : 'json',
                                beforeSend: () => {
                                    pantallaCarga();
                                },
                                success : json => {
                                    if(json.success){
                                        obtenerCantidadCajas(json.codigo,json.presentacion);
                                    }
                                    Swal.fire(json.title, json.message, json.icon);
                                },
                                error : function(xhr, status) {
                                    console.log(xhr.responseJSON);
                                },
                            }); 
                        } else if (result.isDenied) {
                          Swal.fire('No remontado', 'El pallet no se remontó', 'info')
                        }
                      });
                }else{
                    Swal.fire(json.title, json.message, 'info')
                }
            },
            error : function(xhr, status) {
                console.log(xhr.responseJSON);
            },
            complete : function(xhr, status) {
                if(!xhr.responseJSON.success){
                    Swal.fire({
                        position: 'top-end',
                        icon: xhr.responseJSON.icon,
                        title: xhr.responseJSON.message,
                        showConfirmButton: false,
                        timer: 800
                    })
                }
            }
        });
    }
});
$('#modalPallet').on('shown.bs.modal', function () {
    document.getElementById('codigo_pallet').focus();
});
$('#modalRemontar').on('shown.bs.modal', function () {
    document.getElementById('codigo_remontar').focus();
});