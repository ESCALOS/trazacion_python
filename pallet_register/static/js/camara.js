let scanner;
function activarCamara(){
    scanner = new Instascan.Scanner({ video: document.getElementById('preview') });
    Instascan.Camera.getCameras().then(cameras => {
        document.getElementById('formulario').setAttribute('style','display:none');
        document.getElementById('preview').removeAttribute('style');
        scanner.camera = cameras[cameras.length - 1];
        scanner.start();
        $('#modalPallet').modal('show');
        console.log("Hay "+cameras.length+" cámaras.");
    }).catch(e => console.error(e));
    scanner.addListener('scan', content => {
        scanner.stop();
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
                document.getElementById('preview').setAttribute('style','display:none');
                document.getElementById('formulario').removeAttribute('style');
                document.getElementById('codigo').value = json[0].codigo;
                document.getElementById('codigo').value = json[0].dp;
                document.getElementById('presentacion').value = json[0].presentacion;
                document.getElementById('variedad').value = json[0].variedad;
                document.getElementById('categoria').value = json[0].categoria;
                document.getElementById('calibre').value = json[0].calibre;
            },
            error : function(xhr, status) {
                document.getElementById('preview').setAttribute('style','display:none');
                document.getElementById('formulario').removeAttribute('style');
                document.getElementById('codigo').value = content;
                document.getElementById('presentacion').value = 0;
                document.getElementById('variedad').value = "";
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

$('#modalPallet').on('hidden.bs.modal', function (event) {
    scanner.stop();
    scanner.addListener('inactive',() => {
        setTimeout(()=>{ alert('La cámara está apagada')},1000);
    });
  })