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
$().ready(function () {
	initDatepicker();
	initRequestFields();
});

function initRequestFields() {
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
			self.val("מספר חדרים");
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
}

function initDatepicker() {
	var $datepickerElem = $('#request_start_date, #request_end_date');
	var $startDateElem = $('#request_start_date');
	var $endDateElem = $('#request_end_date');
	var dates = $( "#request_start_date, #request_end_date" ).datepicker({
		changeMonth: true,
		minDate: 0, 
		maxDate: "+6M +15D",
		options: {
			dateFormat: "dd/mm/yy"
		},
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
	$datepickerElem.datepicker($.datepicker.regional[ "he" ]);
	$datepickerElem.datepicker( "option", "showAnim", "slideDown" );
	$startDateElem.val('מתאריך');
	$endDateElem.val('עד תאריך');
}

function initWeatherComponent() {
	$.simpleWeather({
        zipcode: 'ISXX0022',
        unit: 'c',
        success: function(weather) {
                html = '<div style=\'width: 100%; text-align: center;\'><br /><br /><p><strong>התחזית ב-'+weather.city+'</strong></p>';
                html += '<p><strong>היום</strong>: '+weather.high+'&deg; / '+weather.low+'&deg; </p>';
                html += '<p><strong>טמפרטורה נוכחית</strong>: '+weather.temp+'&deg;</p>';
                html += '<p><strong>נוכחי</strong>: '+weather.currently+' - <strong>תחזית</strong>: '+weather.forecast+'</p>';
                html += '<p><img src="'+weather.thumbnail+'"></p>';
                html += '<p><strong>לחות</strong>: '+weather.humidity+', <strong>לחץ</strong>: '+weather.pressure+', <strong>ראות</strong>: '+weather.visibility+'</p>';
                html += '<p><strong>התאריך מחר</strong>: '+weather.tomorrow.day+' '+weather.tomorrow.date+'<br /><strong>מחר</strong>: '+weather.tomorrow.high+'&deg; / '+weather.tomorrow.low+'&deg;<br /><strong>תחזית</strong>: '+weather.tomorrow.forecast+'<br /></p>';
                html += '<p>צפה בתחזית מלאה: <a href="'+weather.link+'">Yahoo! Weather</a></p></div>';

                $("#weather").html(html);
        },
        error: function(error) {
                $("#weather").html("<p>"+error+"</p>");
        }
	});
}