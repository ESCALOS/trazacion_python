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
    entradaCajas.setAttribute('onchange','verificarCajas(this)');

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