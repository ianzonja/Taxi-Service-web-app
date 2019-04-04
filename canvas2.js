$(document).ready(function(){
var can = document.getElementById('c-desno2');
var ctx = can.getContext('2d');


ctx.lineWidth = 10;
ctx.strokeStyle = 'steelblue';
ctx.fillStyle = 'steelbllue'; // for the triangle fill
ctx.lineJoin = 'butt';

ctx.beginPath();
ctx.moveTo(0, can.height / 2);
ctx.lineTo(can.width - 110, can.height / 2);
ctx.lineWidth = 20;
ctx.strokeStyle = '#0000ff';
ctx.lineCap = 'butt';
ctx.stroke();
canvas_arrow(ctx, can.width - 100, can.height/2, can.width - 100, can.height/2, 10);
});

function canvas_arrow(context, fromx, fromy, tox, toy, r){
	var x_center = tox;
	var y_center = toy;
	
	var angle;
	var x;
	var y;
	
	context.beginPath();
	
	angle = Math.atan2(toy-fromy,tox-fromx)
	x = r*Math.cos(angle) + x_center;
	y = r*Math.sin(angle) + y_center;

	context.moveTo(x, y);
	
	angle += (1/3)*(2*Math.PI)
	x = r*Math.cos(angle) + x_center;
	y = r*Math.sin(angle) + y_center;
	
	context.lineTo(x, y);
	
	angle += (1/3)*(2*Math.PI)
	x = r*Math.cos(angle) + x_center;
	y = r*Math.sin(angle) + y_center;
	
	context.lineTo(x, y);
	
	context.closePath();
	
	context.fill();
}