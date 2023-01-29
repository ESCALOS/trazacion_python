$(document).ready( function () {
    cargarTabla();
    document.addEventListener('keydown',function obtenerQr(e){
        if(modal_cerrado){
	    if (e.keyCode === 13 && !e.shiftKey && codigo_qr != "") {
            codigo_qr = codigo_qr.replace(".","");
	        e.preventDefault();
		obtenerDatos(codigo_qr)
		codigo_qr = "";
            }else{
	        codigo_qr += e.key;
            }
	}
    });
});
let codigo_qr = "";
let i = 0;
let camaraActiva = false;
let numero_de_la_camara = 0;
let modal_cerrado = true;
let escaner_qr = true;
let pallet_activo = "";
function escanearRemontar(){
    $('#modalRemontar').modal('show');
}
function registrarPallet(){
    codigo = document.getElementById('codigo').value;
    codigo_comercial = document.getElementById('codigo_comercial').value;
    presentacion = document.getElementById('presentacion').value;
    variedad = document.getElementById('variedad').value;
    calibre = document.getElementById('calibre').value;
    etiqueta = document.getElementById('etiqueta').value;
    categoria = document.getElementById('categoria').value;
    detalle = [];
    falta_campo = false;
    for(let j = 0; j < i; j++){
        let dia_de_proceso = document.getElementById('dp'+j).value;
        let numero_de_cajas = document.getElementById('cajas'+j).value;
        let lote = document.getElementById('lote'+j).value;
	if(numero_de_cajas == ''){
	    numero_de_cajas = 0;
	}
	if(dia_de_proceso == ''){
	    dia_de_proceso = 0;
	}
	if(lote == ''){
	    lote = 0;
	}
	if(numero_de_cajas > 0){
 	    if(dia_de_proceso <= 0){
	        document.getElementById('dp'+j).focus();
	        j=i; //break
	        falta_campo = true;
	        $.toast({
		    heading: 'Falta el día de proceso',
		    showHideTransition : 'slide',
		    icon : 'warning',
		    hideAfter: 1500
	        });
	    }else if(lote <= 0){
                document.getElementById('lote'+j).focus();
	        j=i; //break
	        falta_campo = true;
	        $.toast({
		    heading : 'Falta el lote',
		    showHideTransition : 'slide',
		    icon : 'warning',
		    hideAfter: 1500
	        });

	    }else{
		detalle.push([dia_de_proceso,numero_de_cajas,lote]);
	    }
       	}else if(!(numero_de_cajas <= 0 && dia_de_proceso <= 0 && lote <= 0)){
	    document.getElementById('cajas'+j).focus();
	    falta_campo = true;
	    $.toast({
		heading: 'Cantidad Inválida',
		text : 'Ingrese una cantidad válida',
		showHideTransition : 'slide',
		icon : 'warning',
		hideAfter: 1500
	    });
    	}
    }
    if(!falta_campo){	
	$.ajax({
            url : 'add_pallet/',
            data : { 
                csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val(),
                codigo : codigo,
		codigo_comercial: codigo_comercial,
                presentacion : presentacion,
                variedad : variedad,
                categoria : categoria,
                calibre : calibre,
		etiqueta : etiqueta,
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
			$.toast({
			    heading : xhr.responseJSON.message,
			    icon : xhr.responseJSON.icon,
			    showHideTransition : 'slide',
			    hideAfter : 2000,
			    beforeShow : function () {	
		                resetearModal();
				obtenerDatos(pallet_activo);
			    }
			});
                    }else{
                        $.toast({
			    heading : 'No guardado',
			    text : xhr.responseJSON.message,
		 	    showHideTransition : 'slide',
		            icon : xhr.responseJSON.icon,
			    hideAfter : 3500,
			    beforeShow: function (){
				ocultarAlerta();
			    }
			})
                    }
                }
            }
        });
    }
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
                obtenerCantidadCajas(json.codigo,json.presentacion);
                document.getElementById('codigo').value = json.codigo;
		document.getElementById('variedad').innerHTML = json.variedad;
		document.getElementById('codigo_comercial').value = json.codigo_comercial;
		document.getElementById('etiqueta').value = json.etiqueta;
                document.getElementById('presentacion').value = json.presentacion;
                document.getElementById('variedad').value = json.variedad;
                document.getElementById('calibre').value = json.calibre;
                document.getElementById('categoria').value = json.categoria;
                for(i = 0; i<json.detalle.length;i++){
                    nuevoDetalle();
                    document.getElementById('dp'+i).value = json.detalle[i].dia_de_proceso; 
                    document.getElementById('cajas'+i).value = json.detalle[i].numero_de_cajas;  
		            let newOption = new Option(json.detalle[i].fundoLote,json.detalle[i].lote,false,false);
		            $('#lote'+i).append(newOption).trigger('change');
		        }
		        $('#modalRegistro').modal('show');
            }else{
                if(json.icon == 'success'){
                    document.getElementById('codigo').value = content;
                    document.getElementById('variedad').innerHTML = json.variedad;
                    mensajesCajas(0,0);
                    ocultarAlerta();
                    $('#modalRegistro').modal('show');
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
            pallet_activo = content;
        },
        error : function(xhr, status) {
            console.log(xhr);
        },

        complete : function(xhr, status) {
            if(xhr.responseJSON.success){
                ocultarAlerta();
            }
        }
    });
}
function alertToast(heading,text,icon){
    $.toast({
	    heading : heading,
	    text : text,
	    icon : icon,
	    showHideTransition : 'slide',
	    hideAfter : 5000,
	    stack : 4,
	    loader : false,
	    beforeShow: function(){
		ocultarAlerta();
	    }
    })
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
        document.getElementById('cajas_restantes').textContent = "Agregue Cajas";
        document.getElementById('div-agregar-cajas').removeAttribute('style');
        document.getElementById('div-remontar').style.display = "none";
        document.getElementById('btn-registrar-pallet').removeAttribute('style');
	document.getElementById('mensaje_pallet_completo').style.display = 'none';
    }else if(total_cajas == 0){
        document.getElementById('cajas_restantes').removeAttribute('class');
        document.getElementById('cajas_restantes').textContent = "Ninguna caja registrada";
        document.getElementById('div-agregar-cajas').removeAttribute('style');
        document.getElementById('div-remontar').removeAttribute('style');
        document.getElementById('btn-registrar-pallet').removeAttribute('style');
	document.getElementById('mensaje_pallet_completo').style.display = 'none';
    }else if(cajas_restantes < 0){
        document.getElementById('cajas_restantes').setAttribute('class','text-warning');
        document.getElementById('cajas_restantes').textContent = "Sobran " + (cajas_restantes*-1);
        document.getElementById('div-agregar-cajas').removeAttribute('style');
        document.getElementById('div-remontar').removeAttribute('style');
        document.getElementById('btn-registrar-pallet').removeAttribute('style');
	document.getElementById('mensaje_pallet_completo').style.display = 'none';
    }else if(cajas_restantes == 0){
        document.getElementById('cajas_restantes').setAttribute('class','text-success');
        document.getElementById('cajas_restantes').textContent = "Pallet Completo";
        document.getElementById('div-agregar-cajas').style.display = "none";
        document.getElementById('div-remontar').style.display = "none";
        document.getElementById('btn-registrar-pallet').style.display = "none";
	document.getElementById('mensaje_pallet_completo').style.display = 'block';
    }else{
        document.getElementById('cajas_restantes').setAttribute('class','text-danger');
        document.getElementById('cajas_restantes').textContent = "Faltan " + (cajas_restantes);
        document.getElementById('div-agregar-cajas').removeAttribute('style');
        document.getElementById('div-remontar').removeAttribute('style');
        document.getElementById('btn-registrar-pallet').removeAttribute('style');
	document.getElementById('mensaje_pallet_completo').style.display = 'none';
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
	$.toast({
	    heading : 'Seleccione una presentación',
	    icon : 'warning',
	    showHideTransition : 'slide',
	    hideAfter : 1500
	});
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
                dom: 'rtip',
		pageLength : 7
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
    document.getElementById('codigo').value = "";
    document.getElementById('codigo_comercial').value = "";
}
$('#modalRegistro').on('hidden.bs.modal', function (event) {
    resetearModal();
    pallet_activo = "";
    modal_cerrado = true;
    cargarTabla();
})
$('#modalRemontar').on('hidden.bs.modal', function (event) {
    $('#codigo_remontar').val('');
})
$('#codigo_remontar').on('keypress',e=>{
    if (e.keyCode === 13 && !e.shiftKey) {
        let pallet_a_poner = pallet_activo;
        let pallet_a_sacar = $('#codigo_remontar').val();
	    pallet_a_sacar = pallet_a_sacar.replace(".","");
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
					resetearModal();
					obtenerDatos(json.codigo);
				    }
                                    $.toast({
					heading : json.title,
					text : json.message,
				    	icon : json.icon,
				    	showHideTransition : 'slice',
					hideAfter : 2000
				    })
                                },
                                error : function(xhr, status) {
                                    console.log(xhr.responseJSON);
                                },
                            }); 
                        }else if (result.isDenied) {
			    $.toast({
				heading : 'No remontado',
				text : 'Pallet N° ' + pallet_activo + 'no remontado',
				showHideTransition : 'slice',
				icon : 'info',
				hideAfter : 2000
			    })
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
$('#modalRegistro').on('shown.bs.modal', function (){
    modal_cerrado = false;
    document.getElementById('codigo_comercial').focus();
});
$('#modalRemontar').on('shown.bs.modal', function (){
    document.getElementById('codigo_remontar').focus();
});
