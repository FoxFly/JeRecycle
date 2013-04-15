function Put_Value(){
var collection=new Array();
collection[0]=(""+ Math.random()).substring(2,3);
collection[1]=(""+ Math.random()).substring(2,3);
collection[2]=(""+ Math.random()).substring(2,3);
collection[3]=(""+ Math.random()).substring(2,3);
document.getElementById("img1").src="img/"+collection[0]+".png";
document.getElementById("img2").src="img/"+collection[1]+".png";
document.getElementById("img3").src="img/"+collection[2]+".png";
document.getElementById("img4").src="img/"+collection[3]+".png";
}