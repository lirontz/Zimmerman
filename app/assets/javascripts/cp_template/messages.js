// JavaScript Document
var currentMsg = null;
var currentArrow = null;

function showMsg(msgId){
	var e = document.getElementById(msgId+'content');
	var arrow = document.getElementById(msgId+'arrow');
	e.style.display = 'block';
	arrow.src = "../assets/cp_template/smallArrowUp.gif";
		
		
	if(currentMsg){
		if(e.id != currentMsg.id){
			currentMsg.style.display = 'none';
			currentArrow.src = "../assets/cp_template/smallArrowDown.gif";
		} else{//toggle
			if(currentMsg.style.display == 'block'){
				currentMsg.style.display = 'none';
				currentArrow.src = "../assets/cp_template/smallArrowDown.gif";
				e = null;
				currentArrow = null;
			}else{
				currentMsg.style.display = 'block';
				currentArrow.src = "../assets/cp_template/smallArrowUp.gif";
			}
			
		}
	}
	currentMsg = e;
	currentArrow = arrow;
	
}

function selectAll(){
	var e = document.getElementById('messagesContainer').getElementsByTagName('input');
	
	for (var i=0; i < e.length; i++){
		if(e[i].id.indexOf('chbx') >= 0){
			e[i].checked = 'checked';
		}
	}
}


function unSelectAll(){
	var e = document.getElementById('messagesContainer').getElementsByTagName('input');
	
	for (var i=0; i < e.length; i++){
		if(e[i].id.indexOf('chbx') >= 0){
			e[i].checked = '';
		}
	}
}