function load_data(something)
{
	xhttp=new XMLHttpRequest();
	xhttp.open("GET","data.xml",false);
	xhttp.send("");
	xmlDoc=xhttp.responseXML;
	document.getElementById("textarea").innerHTML=xmlDoc.getElementsByTagName(something)[0].childNodes[0].nodeValue;	
}

function save_text() 
{
	var textbox = document.getElementById("textarea");
	var text = textbox.value;
	localStorage["cpad:textbox_text"] = text;
}

function load_text() 
{
	var favorite = localStorage["cpad:textbox_text"];
	if (!favorite) 
	{
		return;
	}
	var textbox = document.getElementById("textarea");
	textbox.value = favorite;
}

function select_textbox()
{
	document.getElementById("textarea").focus();
}

function clear_text()
{
	var textbox = document.getElementById("textarea");	textbox.value = "";
}

function popup(url, wid, hei) 
{
 var width  = wid;
 var height = hei;
 var left   = (screen.width  - width)/2;
 var top    = (screen.height - height)/2;
 var params = 'width='+width+', height='+height;
 params += ', top='+top+', left='+left;
 params += ', directories=no';
 params += ', location=no';
 params += ', menubar=no';
 params += ', resizable=no';
 params += ', scrollbars=no';
 params += ', status=no';
 params += ', toolbar=no';
 newwin=window.open(url,'windowname5', params);
 if (window.focus) {newwin.focus()}
 return false;
}

function menuHover(id1,id2,id3){
	if(document.getElementById('menu').style.display=='none')
	{
	document.getElementById(id1).className='button left hover';
	document.getElementById(id2).className='button mid hover';
	document.getElementById(id3).className='button right hover';
	
	document.getElementById(id1).style.backgroundImage='url(resources/menu/Left_glow.png)';
	document.getElementById(id2).style.backgroundImage='url(resources/menu/Mid_glow.png)';
	document.getElementById(id3).style.backgroundImage='url(resources/menu/Right_glow.png)';
	}
}
function menuLeave(id1,id2,id3){
	if(document.getElementById('menu').style.display!='none')
	{
		document.getElementById(id1).className='button left';
		document.getElementById(id2).className='button mid';
		document.getElementById(id3).className='button right';
		
		document.getElementById(id1).style.backgroundImage='none';	
		document.getElementById(id2).style.backgroundImage='none';	
		document.getElementById(id3).style.backgroundImage='none';
	}		
}
function menuClick(id1,id2,id3){
	var id1 = document.getElementById(id1);
	var id2 = document.getElementById(id2);
	var id3 = document.getElementById(id3);
	id1.className='button left click';
	id2.className='button mid click';
	id3.className='button right click';
	$("#menu").toggleClass("hide");
	
	var button = id1.clientWidth + id2.clientWidth + id3.clientWidth;
	if(button > getOff())
	{
		id1.style.backgroundImage='url(resources/menu/Left_down3.png)';
		id2.style.backgroundImage='url(resources/menu/down_mid2.png)';
		id3.style.backgroundImage='url(resources/menu/down_right2.png)';
		document.getElementById('menuTop').style.backgroundImage='none';
		document.getElementById('menuTop').style.backgroundColor='#2A4869';
	}
	else
	{
		id1.style.backgroundImage='url(resources/menu/down_left2.png)';
		id2.style.backgroundImage='url(resources/menu/down_mid2.png)';
		id3.style.backgroundImage='url(resources/menu/down_right2.png)';
	}
}
function menuClose(id1,id2,id3){
	document.getElementById(id1).className='button left';
	document.getElementById(id2).className='button mid';
	document.getElementById(id3).className='button right';
	
	document.getElementById(id1).style.backgroundImage='none';	
	document.getElementById(id2).style.backgroundImage='none';	
	document.getElementById(id3).style.backgroundImage='none';
	
	$("#menu").addClass("hide");
}
function getOff()
{
	x = document.getElementById('menu');
	return x.offsetWidth;
}
$(document).ready(function() {
	load_text();
	$("#menu_1").click(function() {
		save_text();
	})
	$("#textarea").click(function() {
		save_text();
	})
	$("#textarea").keyup(function() {
		save_text();
	})
	
	$("#menu_2").click(function() {
		menuClick('menu_1','menu_2','menu_3');
	})
	$("#textarea").click(function() {
		menuClose('menu_1','menu_2','menu_3');
	})
	$("#textarea").append("test?");
	
	$("#textarea").append(chrome.extension.getViews());
});