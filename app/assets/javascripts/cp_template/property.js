// JavaScript Document
function addNewProperty(source, dest){
	var newProp = document.getElementById(source).value;
	var list = document.getElementById(dest);
	
	if(newProp==""){
		alert('יש להכניס שם למאפיין');
	} else{
	
	var new_element = document.createElement('li');
	new_element.innerHTML = '<input type="checkbox" name="userProp"  value="userVal" checked="checked" /><span class="propertyTitle">'+newProp;
	list.insertBefore(new_element, list.firstChild);
	document.getElementById(source).value = "";
	}
}


function getNewUserProperties(source, dest){
	var list = document.getElementById(source);
	
	var valArray = new Array();
	
	var a_elements = list.getElementsByTagName("li");

	for (var i = 0, len = a_elements.length; i < len; i++ ) {
		var cb = a_elements[ i ].getElementsByTagName("input");
		var val = a_elements[ i ].getElementsByTagName("span");
		if(cb[0].value == "userVal" && cb[0].checked){
			valArray.push(val[0].innerHTML);
		}
		
		//<input type="checkbox" name="properties" value="airCondition"><span class="propertyTitle">מזגן</span>
	}
	
	if(valArray.length >0 ){
		document.getElementById(dest).value = valArray.join("|");
	}
}



function preventSubmit(el){
	 if (event.keyCode == 13 ) {
		 if(el.value.length >0){ 
			addNewProperty('newProperty', 'propertiesList'); 
		}
        return (false);
	}
}



/* ============ EXTRAS ================= */

function addNewExtra(title, price, dest){
	var newTitle = document.getElementById(title).value;
	var newPrice = document.getElementById(price).value;
	var list = document.getElementById(dest);
	
	if(newTitle==""){
		alert('יש להכניס שם לתוספת');
	} else if(newPrice==""){
		alert('יש להכניס מחיר');
	} else if(isNaN(newPrice)){
		alert('יש להכניס ערך מספרי למחיר');
	} else{
	
	var new_element = document.createElement('li');
	new_element.innerHTML = '<input type="checkbox" name="properties"  value="airCondition" class="extraActive" checked="checked"/><input type="text" name="extraName" value="'+newTitle+'"  class="extraTitle"/><input type="text" value="'+newPrice+'" name="extraPrice"  class="extraPrice" />';
	list.insertBefore(new_element, list.firstChild);
	document.getElementById(title).value = "";
	document.getElementById(price).value = "";
	}
}


function getNewUserExtras(source, dest){
	var list = document.getElementById(source);
	
	var valArray = new Array();
	
	var a_elements = list.getElementsByTagName("li");

	for (var i = 0, len = a_elements.length; i < len; i++ ) {
		var cb = a_elements[ i ].getElementsByTagName("input");
		var val = a_elements[ i ].getElementsByTagName("span");
		if(cb[0].value == "userVal" && cb[0].checked){
			valArray.push(val[0].innerHTML);
		}
		
		//<input type="checkbox" name="properties" value="airCondition"><span class="propertyTitle">מזגן</span>
	}
	
	if(valArray.length >0 ){
		document.getElementById(dest).value = valArray.join("|");
	}
}


/* ============ IMAGES ================= */

function addNewImage(dest){
	var list = document.getElementById(dest);
	
	
	var new_element = document.createElement('li');
	var htmlStr = "";
	htmlStr = '<div class="imageContainer">';
    htmlStr +='<div class="imageData">';
    htmlStr +='<input type="text" name="imageName" id="imageName" class="extraTitle" value="" placeholder="הכנס כותרת לתמונה" /><br /><br /><br /><br />';
    htmlStr +='<input type="file" name="imageSrc" id="imageSrc"  />';
    htmlStr +='<input type="button" value="מחיקה"  class="deleteButton" />';
   	htmlStr +='</div>';
    htmlStr +='<div class="imagePreview"></div>';
    htmlStr +='<div class="imageArrows"><img src="images/arrowUp.gif" width="21" height="21" /><img src="images/spacer.gif" width="21" height="58" /><img src="images/arrowDown.gif" width="21" height="21" /></div>';                
    htmlStr +='</div>';
	
	new_element.innerHTML = htmlStr;
	list.insertBefore(new_element, list.lastChild);
	
	document.getElementById('uploadContainer').scrollTop = 9999999;
}
