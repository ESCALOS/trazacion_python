$(document).ready( function () {
    $('#table_id').DataTable();
} );
let scanner;
let i = 0;
let camaraActiva = false;
function activarCamara(){
    scanner = new Instascan.Scanner({ video: document.getElementById('preview') });
    Instascan.Camera.getCameras().then(cameras => {
        scanner.camera = cameras[cameras.length - 1];
        scanner.start();
        camaraActiva = true;
        $('#modalPallet').modal('show');
        console.log("Hay "+cameras.length+" cámaras.");
    }).catch(e => console.error(e));
    scanner.addListener('scan', content => {
        scanner.stop();
        camaraActiva = false;
        obtenerDatos(content);
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
        success : function(json) {
            console.log(json);
        },
        error : function(xhr, status) {
            console.log(xhr);
        },
        complete : function(xhr, status) {
            alert('Petición realizada');
        }
    });
}
function crearNuevoDetalle(){
    nuevoDetalle();
    i++;
}
function nuevoDetalle(){
    let divRow = document.createElement("div");
    let divColGuia = document.createElement("div");
    let divColCajas = document.createElement("div");
    let divColLote = document.createElement("div");
    let labelGuia = document.createElement("label");
    let labelCajas = document.createElement("label");
    let labelLote = document.createElement("label");
    let entradaGuia = document.createElement("input");
    let entradaCajas = document.createElement("input");
    let entradaLote = document.createElement("input");
    let divDetalle = document.getElementById('detalle');

    //ASIGNANDO LOS ATRIBUTOS
    divRow.setAttribute('id','divRow'+i);
    divColGuia.setAttribute('id','divColGuia'+i);
    divColCajas.setAttribute('id','divColCajas'+i);
    divColLote.setAttribute('id','divColLote'+i);
    labelGuia.setAttribute('id','labelGuia'+i);
    labelCajas.setAttribute('id','labelCaja'+i);
    labelLote.setAttribute('id','labelLote'+i);

    divRow.setAttribute('class','row rowDetalle');

    divColGuia.setAttribute('class','mb-3 col');
    divColCajas.setAttribute('class','mb-3 col');
    divColLote.setAttribute('class','mb-3 col');

    labelGuia.setAttribute('class','form-label');
    labelCajas.setAttribute('class','form-label');
    labelLote.setAttribute('class','form-label');

    //PONIENDO EL NOMBRE DE LOS LABELS
    labelGuia.textContent = "GUIA";
    labelCajas.textContent = "CAJAS";
    labelLote.textContent = "LOTE";

    entradaGuia.setAttribute('class','form-control');
    entradaGuia.type = "text";
    entradaGuia.setAttribute('placeholder','4545646');
    entradaGuia.setAttribute('id','guia'+i);

    entradaCajas.setAttribute('class','form-control');
    entradaCajas.type = "number";
    entradaCajas.setAttribute('placeholder','00');
    entradaCajas.setAttribute('id','cajas'+i);

    entradaLote.setAttribute('class','form-control');
    entradaLote.type = "text";
    entradaLote.setAttribute('placeholder','545646');
    entradaLote.setAttribute('id','lote'+i);


    //PONIENDO LOS ELEMENTOS EN EL DIV DE DETALLE
    divDetalle.appendChild(divRow);

    divRow.appendChild(divColGuia);
    divColGuia.appendChild(labelGuia);
    divColGuia.appendChild(entradaGuia);

    divRow.appendChild(divColCajas);
    divColCajas.appendChild(labelCajas);
    divColCajas.appendChild(entradaCajas);
    
    divRow.appendChild(divColLote);
    divColLote.appendChild(labelLote);
    divColLote.appendChild(entradaLote);
}
function editarPallet(codigo){
    obtenerDatos(codigo);
    $("#modalPallet").modal("show");
}
function obtenerDatos(content){
    $.ajax({
        url : 'datos/',
        data : { 
            csrfmiddlewaretoken: $("input[name=csrfmiddlewaretoken]").val(),
            codigo : content
        },
        type : 'POST',
        dataType : 'json',
        success : function(json) {
            document.getElementById('camara').setAttribute('style','display:none');
            document.getElementById('formulario').removeAttribute('style');
            if(json.success){
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
                document.getElementById('dp').value = "";
                document.getElementById('presentacion').value = "";
                document.getElementById('variedad').value = "";
                document.getElementById('categoria').value = "";
                document.getElementById('calibre').value = "";
            }
        },
        error : function(xhr, status) {
            document.getElementById('camara').setAttribute('style','display:none');
            document.getElementById('formulario').removeAttribute('style');
            document.getElementById('codigo').value = content;
            document.getElementById('dp').value = "";
            document.getElementById('presentacion').value = "";
            document.getElementById('variedad').value = "";
            document.getElementById('categoria').value = "";
            document.getElementById('calibre').value = "";
        },

        complete : function(xhr, status) {
            alert('Petición realizada');
        }
    });
}
$('#modalPallet').on('hidden.bs.modal', function (event) {
    let rowDetalles = Array.prototype.slice.call(document.getElementsByClassName('rowDetalle'),0);
    if(camaraActiva){
        scanner.stop();
    }
    for(element of rowDetalles){
        element.remove();
    }
    document.getElementById('formulario').setAttribute('style','display:none');
    document.getElementById('camara').removeAttribute('style');
    scanner.addListener('inactive',() => {
        setTimeout(()=>{ alert('La cámara está apagada')},1000);
    });
  })