$(document).ready( function () {
    cargarTabla();
    document.addEventListener('keydown',function escanearQr(e){
	if(e.keyCode === 13 && !e.keyShift && codigo_qr != ""){
	    codigo_qr = codigo_qr.replace(".", "");
	    e.preventDefault();
   	    embarcar(codigo_qr);
	    codigo_qr = "";
        }else{
	    codigo_qr += e.key;	
        }
    });
});
let codigo_qr = "";
let modo_embarque = true;
function cargarTabla(){
    $.ajax({
        url: "../tabla_embarque/",
	data:{
	    modo: !modo_embarque
	},
        dataType: 'json',
        beforeSend: () => {
            pantallaCarga();
        },
        success : data => {
            $('#div_embarque').html(data.tabla);    
            $('#table_embarque').DataTable({
                ordering: false,
                dom: 'rtip',
		pageLength: 6
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
function confirmarCambiarModo(){
    Swal.fire({
	title: 'Seguro que desea de cambiar de modo',
	showDenyButton : true,
	confirmButtonText : 'Cambiar Modo',
	denyButtonText : 'Cancelar',
    }).then(result=>{
	if(result.isConfirmed){
	    $.toast({
		heading : 'MODO CAMBIADO',
		icon : 'success',
		showHideTransition : 'slide',
		hideAfter : 2000,
		beforeShow: function() {
		    cambiarModo();
		}
	    });
	}else{
	    $.toast({
		heading: 'SIN CAMBIOS',
		icon : 'info',
		showHideTransition : 'slide',
		hideAfter : 2000
	    })
	}
    })
}
function cambiarModo(){
    modo_embarque = !modo_embarque;
    if(modo_embarque){
	color = 'success';
	modo = 'MODO EMBARQUE';
    }else{
	color = 'warning';
	modo = 'MODO DESEMBARQUE';
    }
    document.getElementById('btn-toggle-embarque').setAttribute('class','btn btn-md btn-'+color+' text-white font-bold w-100 fw-bolder');
    document.getElementById('btn-toggle-embarque').textContent = modo;
    cargarTabla();
}
function embarcar(codigo_pallet){
        $.ajax({
            url: "../embarcar/",
	    data : {
                codigo_pallet : codigo_pallet,
		modo_embarque : modo_embarque,
                csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val(),
            },
            type : 'POST',
            beforeSend: () => {
                pantallaCarga();
            },
            success : data => {
		$.toast({
		    text : data.message,
		    heading: data.title,
	    	    showHideTransition : 'slide',
		    icon : data.icon,
		    stack : 5,
		    hideAfter: 5000,
		    beforeShow: function(){
			if(data.success){
			    cargarTabla();
			}
		        ocultarAlerta();
		    }
		})
            },
            error : (xhr,status) => {
                Swal.fire({
                    icon: 'error',
                    title: 'Ha ocurrido un error',
                    text: 'Actualice la página',
                  })
            },
            complete : (xhr,status) =>{
                //document.getElementsByClassName("swal2-container")[0].style.display = "none";
            } 
        })
}
$('#modalPallet').on('hidden.bs.modal', function (event) {
    $('#codigo_pallet').val('');
})
$('#modalPallet').on('shown.bs.modal', function () {
    document.getElementById('codigo_pallet').focus();
});
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
