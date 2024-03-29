function nuevoDetalle(){
    let divRow = document.createElement("div");
    
    let divColDiaProceso = document.createElement("div");
    let divColCajas = document.createElement("div");
    let divColLote = document.createElement("div");
    let divRowColGC = document.createElement("div");
    let labelDiaProceso = document.createElement("label");
    let labelCajas = document.createElement("label");
    let labelLote = document.createElement("label");
    let entradaDiaProceso = document.createElement("input");
    let entradaCajas = document.createElement("input");
    let entradaLote = document.createElement("select");
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
    entradaDiaProceso.type = "number";
    entradaDiaProceso.setAttribute('placeholder','4545646');
    entradaDiaProceso.setAttribute('id','dp'+i);

    entradaCajas.setAttribute('class','form-control');
    entradaCajas.type = "number";
    entradaCajas.setAttribute('placeholder','00');
    entradaCajas.setAttribute('id','cajas'+i);
    entradaCajas.setAttribute('min',1)
    entradaCajas.setAttribute('onchange','verificarCajas(this)');

    entradaLote.setAttribute('class','form-control');
    entradaLote.setAttribute('id','lote'+i);
    entradaLote.setAttribute('style','display:none;width:100%');

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

    $('#lote'+i).select2({
	ajax: {
	    method : "GET",
	    url : 'lotes',
	    dataType: 'json',
	    delay: 300,
	    processResults: function(data){
		return {
		    results : data.lotes
		}
	    },
	    cache: true
	},
	language : "es",
	minimumInputLength : 3,
	dropdownParent : $("#divColLote"+i),
	width : 'resolve'
    });

    document.getElementById('dp'+i).focus();
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
