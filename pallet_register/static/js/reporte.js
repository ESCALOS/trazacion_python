$(document).ready( function () {
    cargarTabla();
} );
let i = 0;
function crearNuevoDetalle(){
    nuevoDetalle();
    i++;
}
function editarPallet(codigo){
    obtenerDatos(codigo);
    $("#modalPallet").modal("show");
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
                dom: 'QBrtip',
                buttons: [
                    'colvis',
                    {
                        extend: 'print',
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
                    {
                        extend: 'excel',
                        exportOptions: {
                            columns: ':visible'
                        },
                        autoFilter: true,
                        sheetName: "Registro de Pallets"
                    },
                    {
                        extend: 'pdf',
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
                ],
                searchBuilder: {
                    conditions: {
                        num: {
                            '!between':null,
                            '!contains':null,
                            '!ends':null,
                            '!starts':null
                        },
                        string: {
                            '!null':null,
                            'null':null,
                            '!contains':null,
                            '!ends':null,
                            '!starts':null,
                        },
                        date: {
                            '!null': null,
                            'null':null,
                            '!between':null
                        }
                    }
                }
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
$('#modalPallet').on('hidden.bs.modal', function (event) {
    resetearModal();
})