$(document).ready(function(){
    var can, ctx,
            minVal, maxVal,
            xScalar, yScalar,
            numSamples, y;
    var podaci = document.getElementsByClassName("uponi_tableSection");
    var novipodaci = [];
    for(var i=0; i<podaci.length; i++){
        if(i!=0 && i!= 1 && i!=2 && i!=3 && i!=4){
            novipodaci.push(podaci[i]);
        }
    }
    var korisnici = [];
    var akcije = [];
    var datumi = [];
    var bodovi = [];
    for(var i=0; i<novipodaci.length; i = i+4){
        korisnici.push(novipodaci[i].innerText);
        akcije.push(novipodaci[i+1].innerText);
        datumi.push(novipodaci[i+2].innerText);
        bodovi.push(novipodaci[i+3].innerText);
    }
// data sets -- set literally or obtain from an ajax call
    var dataName = [];
    var dataValue = [];
    var vrijednostiKorisnika = [];
    for(var i=0; i<korisnici.length; i++){
        if(dataName.indexOf(korisnici[i]) == -1){
            dataName.push(korisnici[i])
            dataValue.push(1);
        }else{
            var index = dataName.indexOf(korisnici[i]);
            dataValue[index] = dataValue[index]+1;
        }
    }
    numSamples = dataValue.length;
    maxVal = 50;
    var stepSize = 10;
    var colHead = 50;
    var rowHead = 60;
    var margin = 10;
    var header = "Ukupno akcija"
    can = document.getElementById("can");
    ctx = can.getContext("2d");
    ctx.fillStyle = "black"
    yScalar = (can.height - colHead - margin) / (maxVal);
    xScalar = (can.width - rowHead) / (numSamples + 1);
    ctx.strokeStyle = "rgba(128,128,255, 0.5)"; // light blue line
    ctx.beginPath();
// print  column header
    ctx.font = "10pt Helvetica"
    ctx.fillText(header, 0, colHead - margin);
// print row header and draw horizontal grid lines
    ctx.font = "8pt Helvetica"
    var count = 0;
    for (scale = maxVal; scale >= 0; scale -= stepSize) {
        y = colHead + (yScalar * count * stepSize);
        ctx.fillText(scale, margin, y + margin);
        ctx.moveTo(rowHead, y)
        ctx.lineTo(can.width, y)
        count++;
    }
    ctx.stroke();
// label samples
    ctx.font = "14pt Helvetica";
    ctx.textBaseline = "bottom";
    for (var i = 0; i < dataName.length; i++) {
        calcY(can, dataValue[i], yScalar);
        ctx.fillText(dataName[i], xScalar * (i + 1), y - 350);
    }
// set a color and a shadow
    ctx.fillStyle = "green";
    ctx.shadowColor = 'rgba(128,128,128, 0.5)';
    ctx.shadowOffsetX = 20;
    ctx.shadowOffsetY = 1;
// translate to bottom of graph and scale x,y to match data
    ctx.translate(0, can.height - margin);
    ctx.scale(xScalar, -1 * yScalar);
// draw bars
    for (i = 0; i < 4; i++) {
        ctx.fillRect(i + 1, 0, 0.5, dataValue[i]);
    }
});
function calcY(can, value, yScalar) {
    y = can.height - value * yScalar;
}