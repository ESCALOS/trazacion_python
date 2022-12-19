$(document).ready( function () {
    cargarTabla();
} );
function cargarTabla(){
    $.ajax({
        url: "../tabla_embarque/",
        dataType: 'json',
        beforeSend: () => {
            pantallaCarga();
        },
        success : data => {
            $('#div_embarque').html(data.tabla);
            
            $('#table_embarque').DataTable({
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
function escanearPallet(){
    $('#modalPallet').modal('show');
}
$('#codigo_pallet').on('keypress',e=>{
    if (e.keyCode === 13 && !e.shiftKey) {
        let codigo_pallet = $('#codigo_pallet').val();
        e.preventDefault();
        $('#modalPallet').modal('hide');
        $.ajax({
            url: "../embarcar/",data : {
                codigo_pallet : codigo_pallet,
                csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val(),
            },
            type : 'POST',
            beforeSend: () => {
                pantallaCarga();
            },
            success : data => {
                Swal.fire({
                    title: data.message, 
                    icon: data.icon,
                }).then(result=>{
                    if(result.isConfirmed){
                        cargarTabla()
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
                //document.getElementsByClassName("swal2-container")[0].style.display = "none";
            } 
        })
    }
});
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