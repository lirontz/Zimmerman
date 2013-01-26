// JavaScript Document
var tabs = new Array();

function displayTab(containerDiv, selectedId){
	
	var e = document.getElementById(containerDiv).getElementsByTagName('div');
	
	for (var i=0; i < e.length; i++){
		if(e[i].id.indexOf('content-') >= 0){
			if(e[i].id != selectedId){
				e[i].style.display = 'none';
				document.getElementById('link-' + e[i].id).className = 'none';
			} else {
				e[i].style.display = 'block';
				document.getElementById('link-' + e[i].id).className = 'selected';
			}
		}
	}
}

function displayGlobalTab(containerDiv, selectedId){
	
	var e = document.getElementById(containerDiv).getElementsByTagName('div');
	
	for (var i=0; i < e.length; i++){
		if(e[i].id.indexOf('main-') >= 0){
			if(e[i].id != selectedId){
				e[i].style.display = 'none';
				//document.getElementById('link-' + e[i].id).className = 'none';
			} else {
				e[i].style.display = 'block';
				//document.getElementById('link-' + e[i].id).className = 'selected';
			}
		}
	}
}