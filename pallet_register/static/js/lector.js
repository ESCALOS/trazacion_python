$(document).ready(function (){
	cargarTabla();
});
let i = 0;
let camaraActiva = false;
let numero_de_la_camara_activa = true;
let recargarTabla = true;
let scanner = "";

function cambiarCamara(){
    scanner.stop().then(()=>{
        camaraActiva = false;
        document.getElementById('preview').outerHTML = document.getElementById('preview').outerHTML;
        numero_de_la_camara_activa = !numero_de_la_camara_activa;
        activarCamara();
    });
}

function activarCamara(){
	scanner = new Instascan.Scanner({
		video : document.getElementById('preview'),
		mirror : false,
		backgroundScan : false
	});
	document.getElementById('btnCambiarCamara').disabled = true;
	pantallaCarga();

	Instascan.Camera.getCameras().then(cameras => {
		if(cameras.length > 0){
			scanner.camera = cameras[numero_de_la_camara_activa ? 1 : 0];
			scanner.start();
			scanner.addListener('active',()=>{
            	$('#modalPallet').modal('show');
            	ocultarAlerta();
                camaraActiva = true;
            });
		}else{
			Swal.fire(
                'Sin cámaras',
                'No se encontraron cámaras',
                'error',
                );
        }
        document.getElementById('btnCambiarCamara').disabled = false;
	}).catch(e => {
        alert(e);
    });

    scanner.addListener('scan',codigo => {
    	 scanner.stop().then(()=>{
            camaraActiva = false;
            $('#modalPallet').modal('hide');
	        codigo = codigo.replace(".","");
            obtenerDatos(codigo);
        });
    });
}
function cargarTabla(){
	$.ajax({
		url: "../tabla/",
		dataType:'json',
		beforeSend: () => {
			pantallaCarga();
		},
		success: data => {
			$('#tabla_pallets').html(data.tabla);
            
            $('#table_id').DataTable({
                ordering: false,
                dom: 'rtip',
				pageLength : 7
            });
        },
		error: (xhr,status) => {
			console.log(xhr);
			Swal.fire({
				icon: 'error',
				title: 'Ha ocurrido un error',
				text: 'Actualice la página',
			})
		},
		complete: (xhr,status) => {
            document.getElementsByClassName("swal2-container")[0].style.display = "none";
		}
	})
}
function editarPallet(codigo){
	resetearModal();
	obtenerDatos(codigo);
}
function obtenerDatos(codigo){
	$.ajax({
		url : '../datos/',
		data : {
			codigo : codigo,
		},
		type : 'GET',
		dataType : 'json',
		beforeSend : () => {
			pantallaCarga();
		},
		success : json => {
			if(json.success){
				document.getElementById('modalTitle').textContent="Datos del Pallet";
                obtenerCantidadCajas(json.codigo,json.presentacion);
                document.getElementById('codigo').innerHTML = json.codigo;
		        document.getElementById('variedad').innerHTML = json.variedad;
		        document.getElementById('codigo_comercial').innerHTML = json.codigo_comercial;
		        document.getElementById('etiqueta').innerHTML = json.etiqueta_name;
                document.getElementById('presentacion').innerHTML = json.presentacion_name;
                document.getElementById('calibre').innerHTML = json.calibre_name;
                document.getElementById('categoria').innerHTML = json.categoria_name;
                for(i = 0; i<json.detalle.length;i++){
                    nuevoDetalle();
                    document.getElementById('dp'+i).innerHTML = json.detalle[i].dia_de_proceso;
                    document.getElementById('cajas'+i).innerHTML = json.detalle[i].numero_de_cajas;
                    document.getElementById('lote'+i).innerHTML = json.detalle[i].fundoLote;
		        }
				$('#modalLector').modal('show');
            }else{
                if(json.icon == 'success'){
                    $.toast({
                        heading : "Pallet no Registrado",
                        icon : "warning",
                        showHideTransition : 'slide',
                        hideAfter : 2000,
                        beforeShow: function() {
                            ocultarAlerta();
                        }
                    })
                }else{
                    $.toast({
                        heading : json.message,
                        icon : json.icon,
                        showHideTransition : 'slide',
                        hideAfter : 2000,
                        beforeShow: function() {
                            ocultarAlerta();
                        }
                    })
                }
            }
		},
		error : (xhr,status) => {
			console.log(xhr);
		},
		complete: (xhr,status) => {
			ocultarAlerta();
		}
	})
}
function nuevoDetalle(){
    let divRow = document.createElement("div");
    
    let divColDiaProceso = document.createElement("div");
    let divColCajas = document.createElement("div");
    let divColLote = document.createElement("div");
    let divRowColGC = document.createElement("div");
    let labelDiaProceso = document.createElement("label");
    let labelCajas = document.createElement("label");
    let labelLote = document.createElement("label");
    let entradaDiaProceso = document.createElement("label");
    let entradaCajas = document.createElement("label");
    let entradaLote = document.createElement("label");
    let divDetalle = document.getElementById('detalle');
    let hr = document.createElement('hr');

    //ASIGNANDO LOS ATRIBUTOS
    divRow.setAttribute('id','divRow'+i);
    divRowColGC.setAttribute('id','divRowColGC'+i);

    divColDiaProceso.setAttribute('id','divColDiaProceso'+i);
    divColCajas.setAttribute('id','divColCajas'+i);
    divColLote.setAttribute('id','divColLote'+i);
    labelDiaProceso.setAttribute('id','labelDiaProceso'+i);
    labelCajas.setAttribute('id','labelCaja'+i);
    labelLote.setAttribute('id','labelLote'+i);
  
    divRow.setAttribute('class','rowDetalle');
    divRowColGC.setAttribute('class','row');
    hr.setAttribute('class','rowDetalle');

    divColDiaProceso.setAttribute('class','col');
    divColCajas.setAttribute('class','col');
    divColLote.setAttribute('class','col');

    labelDiaProceso.setAttribute('class','form-label');
    labelCajas.setAttribute('class','form-label');
    labelLote.setAttribute('class','form-label');

    //PONIENDO EL NOMBRE DE LOS LABELS
    labelDiaProceso.textContent = "DP";
    labelCajas.textContent = "CAJAS";
    labelLote.textContent = "LOTE";

    entradaDiaProceso.setAttribute('class','form-control');
    entradaDiaProceso.setAttribute('id','dp'+i);

    entradaCajas.setAttribute('class','form-control');
    entradaCajas.setAttribute('id','cajas'+i);

    entradaLote.setAttribute('class','form-control');
    entradaLote.setAttribute('id','lote'+i);
    entradaLote.setAttribute('style','width:100%');

    //PONIENDO LOS ELEMENTOS EN EL DIV DE DETALLE
    divDetalle.appendChild(divRow);

    divRow.appendChild(divRowColGC);

    divRowColGC.appendChild(divColDiaProceso);
    divColDiaProceso.appendChild(labelDiaProceso);
    divColDiaProceso.appendChild(entradaDiaProceso);

    divRowColGC.appendChild(divColCajas);
    divColCajas.appendChild(labelCajas);
    divColCajas.appendChild(entradaCajas);
    
    divRow.appendChild(divColLote);
    divColLote.appendChild(labelLote);
    divColLote.appendChild(entradaLote);
    divDetalle.appendChild(hr);
}
function obtenerCantidadCajas(codigo,presentacion){
    $.ajax({
        url : '../cantidad_cajas/',
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
        document.getElementById('cajas_restantes').textContent = "Agregue Cajas";
	    document.getElementById('mensaje_pallet_completo').style.display = 'none';
    }else if(total_cajas == 0){
        document.getElementById('cajas_restantes').removeAttribute('class');
        document.getElementById('cajas_restantes').textContent = "Ninguna caja registrada";
		document.getElementById('mensaje_pallet_completo').style.display = 'none';
    }else if(cajas_restantes < 0){
        document.getElementById('cajas_restantes').setAttribute('class','text-warning');
        document.getElementById('cajas_restantes').textContent = "Sobran " + (cajas_restantes*-1);
		document.getElementById('mensaje_pallet_completo').style.display = 'none';
    }else if(cajas_restantes == 0){
        document.getElementById('cajas_restantes').setAttribute('class','text-success');
        document.getElementById('cajas_restantes').textContent = "Pallet Completo";
		document.getElementById('mensaje_pallet_completo').style.display = 'block';
    }else{
        document.getElementById('cajas_restantes').setAttribute('class','text-danger');
        document.getElementById('cajas_restantes').textContent = "Faltan " + (cajas_restantes);
		document.getElementById('mensaje_pallet_completo').style.display = 'none';
    }
}

$('#modalLector').on('hidden.bs.modal', function (){
    resetearModal();
});

$('#modalPallet').on('hidden.bs.modal', function (){
    if(camaraActiva){
        scanner.stop();
    }
    document.getElementById('preview').outerHTML = document.getElementById('preview').outerHTML;
});


function resetearModal(){
    let rowDetalles = Array.prototype.slice.call(document.getElementsByClassName('rowDetalle'),0);
    i = 0;
    for(element of rowDetalles){
        element.remove();
    }
    document.getElementById('codigo').innerHTML = "";
    document.getElementById('codigo_comercial').innerHTML = "";
}

function pantallaCarga(){
    Swal.fire({
        title: 'Cargando!',
        text: 'Espere un momento',
        imageUrl: "../static/images/load.gif",
        imageWidth: 400,
        imageHeight: 200,
        imageAlt: 'Pantalla de carga',
        showConfirmButton: false,
      })
}

function ocultarAlerta(){
    document.getElementsByClassName("swal2-container")[0].style.display = "none"
}
