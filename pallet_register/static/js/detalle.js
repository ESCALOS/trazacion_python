$(document).ready( function () {
    $('#table_detalle').DataTable({
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
    });
} );
function pantallaCarga(){
    Swal.fire({
        title: 'Cargando!',
        text: 'Espere un momento',
        imageUrl: "static/images/load.gif",
        imageWidth: 400,
        imageHeight: 200,
        imageAlt: 'Pantalla de carga',
        showConfirmButton: false,
      })
}
function ocultarAlerta(){
    document.getElementsByClassName("swal2-container")[0].style.display = "none"
}