
function DropdownClick()
{
 	document.getElementById("DropDownContent").classList.toggle("show");
}
var div=document.getElementById("DropDownContent");
window.onclick=function(e)
{


if(e.target.matches('.dropbtn'))
{
  
	
	
	div.style.display="block";
	


}
else
{
	div.style.display="none";
	
}

}


