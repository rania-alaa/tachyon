
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

var Rating=document.getElementById("rating");

Rating.addEventListener("click",function(e)
{
	for(var i=1;i<=5;i++)
	{
		if(parseInt(e.target.id)==i)
		{
 			for(var j=1;j<=i;j++)

			{
 	document.getElementById(j.toString()).src="starh.png "; 

			}
		}
	}
});
window.onload=function(){
var summary_of_book=document.getElementById("summary");
console.log(summary_of_book);

};
var arch=document.getElementsByTagName("a");
function f1()
{

console.log(arch);

location.href="/Books/Book_page.html";

}
