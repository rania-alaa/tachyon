
function DropdownClick()
{
 	document.getElementById("DropDownContent").classList.toggle("show");
}
var div=document.getElementById("DropDownContent");
window.onclick=function(e)
{
if(e.target.matches('.dropbtn'))
{
  
	console.log(document.getElementById("DropDownContent"));
	console.log(div.getElementsByTagName("a").length);
	div.style.display="block";
	div.addEventListener("click",function(event){
	var btn=document.getElementsByClassName("dropbtn");
	div.style.display="none";
	btn.innerHTML="Read";

});

}
else
{
	div.style.display="none";
}
}


