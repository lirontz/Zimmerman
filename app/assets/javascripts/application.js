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
});

function initRequestFields() {
	$("#accordion2").collapse({hide:true});
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
	$("#user_email").focus(function () {
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
	/*$("#user_email_confirmation").focus(function () {
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
	});*/
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
	});
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
		showAnim: "slideDown",
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
    $('#div1').hide();
    $('#div2').show();
    $('#site_owner_password').focus();
}
 
function restorePassBox() {
    if($('#site_owner_password').val() == '') {
      $('#div1').show();
      $('#div2').hide();
    }
}

function changePassBox1() {
    $('#div3').hide();
    $('#div4').show();
    $('#site_owner_password_confirmation').focus();
}
 
function restorePassBox1() {
    if($('#site_owner_password_confirmation').val() == '') {
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