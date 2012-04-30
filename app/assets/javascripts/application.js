// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .

$(document).ready(function () {
	initDatepicker();
	initRequestFields();
	initSiteEditorTab();
	$('input[placeholder]').defaultValue();
	$("a[rel='tooltip']").css('textDecoration', 'none');
	$("a[rel='tooltip']").css('padding', 7);
});

function initSiteEditorTab() {
	$("#current_site_properties_select_all").click(function () {
		if (this.checked) {
			$("input:checkbox[id^='room_porperty_site_list']").attr('checked', this.checked);
		} else {
			$(this).attr('checked', true);
			$("input:checkbox[id^='room_porperty_site_list']").click();
		}
	});

	$("#site_properties_select_all").click(function () {
		$("input:checkbox[id^='room_porperty_list']:visible").attr('checked', this.checked);
	});

	$("input:checkbox[id^='room_porperty_site_list']").click(function () {		
		var me = $(this);
		var tr = me.parent().parent().parent();
		var tbody = tr.parent();
		var label = $('label[for="' + me.attr('id') + '"]');
		var priceTd = tr.children('td:last-child');
		
		priceTd.remove();
		if (tbody.children().length == 1) {
			$("#current_room_porperty_list_table").hide();
			$("#current_room_porperty_list_empty_container").show();
		}

		tr.attr('id', tr.attr('id').replace('current_', '').replace('site_', ''));
		me.attr('id', me.attr('id').replace('_site', ''));
		me.attr('name', me.attr('name').replace('_site', ''));
		label.attr('for', label.attr('for').replace('_site', ''));
		me.unbind('click');
		$('#room_porperty_list_table > tbody:last').append(tr);
		$("#room_porperty_list_table").show();
		$("#room_porperty_list_empty_container").hide();
	});
}

function initRequestFields() {
	//$("#accordion2").collapse({hide:true});
	//TODO: merge all following function to one function
	$("#request_how_many_rooms").focus(function () {
		var self = $(this);
		
		if (isNaN(self.val())) {
			self.val("");
		}
	});
	$("#request_how_many_rooms").blur(function () {
		var self = $(this);
		var val = self.val();

		if (val === '' || isNaN(val)) {
			self.val("מספר יחידות");
		}
	});
	$("#request_price_from").focus(function () {
		var self = $(this);
		
		if (isNaN(self.val())) {
			self.val("");
		}
	});
	$("#request_price_from").blur(function () {
		var self = $(this);
		var val = self.val();

		if (val === '' || isNaN(val)) {
			self.val("ממחיר");
		}
	});
	$("#request_price_to").focus(function () {
		var self = $(this);
		
		if (isNaN(self.val())) {
			self.val("");
		}
	});
	$("#request_price_to").blur(function () {
		var self = $(this);
		var val = self.val();

		if (val === '' || isNaN(val)) {
			self.val("עד מחיר");
		}
	});
	/*$("#user_email").focus(function () {
		var self = $(this);
		var val = self.val();

		if (val === 'דוא"ל') {
			self.val("");
		}
	});
	$("#user_email").blur(function () {
		var self = $(this);
		var val = self.val();

		if (val === '') {
			self.val('דוא"ל');
		}
	});
	$("#user_email_confirmation").focus(function () {
		var self = $(this);
		var val = self.val();

		if (val === 'אימות דוא"ל') {
			self.val("");
		}
	});
	$("#user_email_confirmation").blur(function () {
		var self = $(this);
		var val = self.val();

		if (val === '') {
			self.val('אימות דוא"ל');
		}
	});
	$("#user_first_name").focus(function () {
		var self = $(this);
		var val = self.val();

		if (val === 'שם פרטי') {
			self.val("");
		}
	});
	$("#user_first_name").blur(function () {
		var self = $(this);
		var val = self.val();

		if (val === '') {
			self.val('שם פרטי');
		}
	});
	$("#user_last_name").focus(function () {
		var self = $(this);
		var val = self.val();

		if (val === 'שם משפחה') {
			self.val("");
		}
	});
	$("#user_last_name").blur(function () {
		var self = $(this);
		var val = self.val();

		if (val === '') {
			self.val('שם משפחה');
		}
	});
	$("#user_phone").focus(function () {
		var self = $(this);
		var val = self.val();

		if (val === 'טלפון') {
			self.val("");
		}
	});
	$("#user_phone").blur(function () {
		var self = $(this);
		var val = self.val();

		if (val === '') {
			self.val('טלפון');
		}
	});*/
	$("#site_owner_email").focus(function () {
		var self = $(this);
		var val = self.val();

		if (val === 'דוא"ל') {
			self.val("");
		}
	});
	$("#site_owner_email").blur(function () {
		var self = $(this);
		var val = self.val();

		if (val === '') {
			self.val('דוא"ל');
		}
	});
	$("#user_password").focus(function () {
		var self = $(this);
		var val = self.val();

		if (val === 'סיסמה') {
			self.val('');
		}
	});
	$("#user_password").blur(function () {
		var self = $(this);
		var val = self.val();

		if (val === '') {
			self.val('סיסמה');
		}
	});
	//$("#accordion2").on('click', function (e) { e.preventDefault(); })
}

function initDatepicker() {
	var $datepickerElem = $('#request_start_date, #request_end_date');
	var $startDateElem = $('#request_start_date');
	var $endDateElem = $('#request_end_date');
	var dates = $datepickerElem.datepicker({
		minDate: 0,
		maxDate: "+6M +15D",
		changeMonth: true,
		onSelect: function( selectedDate ) {
			var option = this.id == "request_end_date" ?  "maxDate" : "minDate",
				instance = $( this ).data( "datepicker" ),
				date = $.datepicker.parseDate(
					instance.settings.dateFormat ||
					$.datepicker._defaults.dateFormat,
					selectedDate, instance.settings );
			dates.not( this ).datepicker( "option", option, date );
		}
	});
	$datepickerElem.datepicker( "option", "showAnim", "slideDown" );
	$startDateElem.val('מתאריך');
	$endDateElem.val('עד תאריך');
}

function changePassBox() {
	var elem = $('#site_owner_password').length > 0 ? $('#site_owner_password') : $('#user_password').length > 0 ? $('#user_password') : null;

    $('#div1').hide();
    $('#div2').show();
    elem.focus();
}
 
function restorePassBox() {
    var elem = $('#site_owner_password').length > 0 ? $('#site_owner_password') : $('#user_password').length > 0 ? $('#user_password') : null;
    
    if(elem && elem.val() == '') {
      $('#div1').show();
      $('#div2').hide();
    }
}

function changePassBox1() {
	var elem = $('#site_owner_password_confirmation').length > 0 ? $('#site_owner_password_confirmation') : $('#user_password_confirmation').length > 0 ? $('#user_password_confirmation') : null;
    
    $('#div3').hide();
    $('#div4').show();
    elem.focus();
}
 
function restorePassBox1() {
	var elem = $('#site_owner_password_confirmation').length > 0 ? $('#site_owner_password_confirmation') : $('#user_password_confirmation').length > 0 ? $('#user_password_confirmation') : null;

    if(elem && elem.val() == '') {
      $('#div3').show();
      $('#div4').hide();
    }
}

function changePassBox2() {
    $('#div5').hide();
    $('#div6').show();
    //$('#site_owner_password').focus();
}
 
function restorePassBox2() {
    if($('#site_owner_password').val() == '') {
      $('#div5').show();
      $('#div6').hide();
    }
}

function validateNewUserForm(elem) {
	var $firstNameElem = $("#user_first_name");
	var $lastNameElem = $("#user_last_name");
	var firstNameVal = $firstNameElem.val();
	var lastNameVal = $lastNameElem.val();
	var $phoneElem = $("#user_phone");
	var phoneVal = $phoneElem.val();
	var $userTermOfUseConfirmed = $("#user_terms_of_use_confirmed");
	var $userTermOfUseConfirmedLabel = $("label[for='user_terms_of_use_confirmed']");
	//var regexPhone1 = /^[0][5][0]-\d{7}|[0][5][2]-\d{7}|[0][5][4]-\d{7}|[0][5][7]-\d{7}|[0][7][7]-\d{7}|[0][2]-\d{7}|[0][3]-\d{7}|[0][4]-\d{7}|[0][8]-\d{7}|[0][9]-\d{7}|[0][5][0]\d{7}|[0][5][2]\d{7}|[0][5][4]\d{7}|[0][5][7]\d{7}|[0][7][7]\d{7}|[0][2]\d{7}|[0][3]\d{7}|[0][4]\d{7}|[0][8]\d{7}|[0][9]\d{7}$/;
	var regexPhone2 = /^\b\d{2,3}-*\d{7}\b$/;

	if (firstNameVal == "" || firstNameVal == "שם פרטי") {
		$firstNameElem.focus();
		return false;
	}
	if (lastNameVal == "" || lastNameVal == "שם משפחה") {
		$lastNameElem.focus();
		return false;
	}
	if (!regexPhone2.test(phoneVal)) {
		$phoneElem.val("");	
		$phoneElem.focus();
		return false;
	}
	if (!$userTermOfUseConfirmed.is(':checked')) {
		$userTermOfUseConfirmedLabel.css('color', 'red');
		return false;
	} else {
		$userTermOfUseConfirmedLabel.css('color', '#000000');
	}
	return true;
}

function validateRequestForm(elem) {
	var $howManyRoomsElem = $("#request_how_many_rooms");
	var howManyRoomsVal = parseInt($howManyRoomsElem.val());
	var $priceFromElem = $('#request_price_from');
	var $priceToElem = $('#request_price_to');
	var priceFromVal = parseInt($priceFromElem.val());
	var priceToVal = parseInt($priceToElem.val());
	var $startDateElem = $('#request_start_date');
	var $endDateElem = $('#request_end_date');
	var startDateVal = $startDateElem.val();
	var endDateVal = $endDateElem.val();
	var $firstNameElem = $("#user_first_name");
	var $lastNameElem = $("#user_last_name");
	var firstNameVal = $firstNameElem.val();
	var lastNameVal = $lastNameElem.val();
	var $phoneElem = $("#user_phone");
	var phoneVal = $phoneElem.val();
	var $userTermOfUseConfirmed = $("#user_terms_of_use_confirmed");
	var $userTermOfUseConfirmedLabel = $("label[for='user_terms_of_use_confirmed']");
	var regexDate = /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;
	//var regexPhone1 = /^[0][5][0]-\d{7}|[0][5][2]-\d{7}|[0][5][4]-\d{7}|[0][5][7]-\d{7}|[0][7][7]-\d{7}|[0][2]-\d{7}|[0][3]-\d{7}|[0][4]-\d{7}|[0][8]-\d{7}|[0][9]-\d{7}|[0][5][0]\d{7}|[0][5][2]\d{7}|[0][5][4]\d{7}|[0][5][7]\d{7}|[0][7][7]\d{7}|[0][2]\d{7}|[0][3]\d{7}|[0][4]\d{7}|[0][8]\d{7}|[0][9]\d{7}$/;
	var regexPhone2 = /^\b\d{2,3}-*\d{7}\b$/;

	if (isNaN(howManyRoomsVal) || howManyRoomsVal < 0 || howManyRoomsVal > 100) {
		$howManyRoomsElem.val("");
		$howManyRoomsElem.focus();
		return false;
	}
	if (!regexDate.test(startDateVal)) {
		$startDateElem.focus();
		return false;
	}
	if (!regexDate.test(endDateVal)) {
		$endDateElem.focus();
		return false;
	}
	if (isNaN(priceFromVal) || priceFromVal < 0 || priceFromVal > 10000) {
		$priceFromElem.val("");
		$priceFromElem.focus();
		return false;
	}
	if (isNaN(priceToVal) || priceToVal < 0 || priceToVal > 10000) {
		$priceToElem.val("");
		$priceToElem.focus();
		return false;
	}
	if (priceToVal < priceFromVal) {
		$priceToElem.val("");
		$priceFromElem.val("");
		$priceFromElem.focus();
		return false;
	}
	if (firstNameVal == "" || firstNameVal == "שם פרטי") {
		$firstNameElem.focus();
		return false;
	}
	if (lastNameVal == "" || lastNameVal == "שם משפחה") {
		$lastNameElem.focus();
		return false;
	}
	if (!regexPhone2.test(phoneVal)) {
		$phoneElem.val("");	
		$phoneElem.focus();
		return false;
	}
	if (!$userTermOfUseConfirmed.is(':checked')) {
		$userTermOfUseConfirmedLabel.css('color', 'red');
		return false;
	} else {
		$userTermOfUseConfirmedLabel.css('color', '#000000');
	}
	return true;
}

function fillAutoForm() {
	var $howManyRoomsElem = $("#request_how_many_rooms");
	var $priceFromElem = $('#request_price_from');
	var $priceToElem = $('#request_price_to');
	var $userEmail = $("#user_email");
	var $startDateElem = $('#request_start_date');
	var $endDateElem = $('#request_end_date');
	var $firstNameElem = $("#user_first_name");
	var $lastNameElem = $("#user_last_name");
	var $phoneElem = $("#user_phone");
	var $userTermOfUseConfirmed = $("#user_terms_of_use_confirmed");

	
	$howManyRoomsElem.val("2");
	$priceFromElem.val("500");
	$priceToElem.val("1000");
	$userEmail.val("lirontz@gmail.com");
	$startDateElem.val("23/06/2012");
	$endDateElem.val("23/07/2012");
	$firstNameElem.val("לירון");
	$lastNameElem.val("צרפתי");
	$phoneElem.val("0546911012");
	$userTermOfUseConfirmed.prop("checked", true);
}




