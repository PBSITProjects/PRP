$(document).on("accountants#edit:loaded accountants#new:loaded", function() {
  locale = gon.I18n;


  $.datepicker.setDefaults($.datepicker.regional[locale]);  

  $('#accountant_start_date').datepicker({
	showOn: 'button',
    changeYear: true,
    changeMonth: true,
    yearRange:"-60:+1"});

  $('#accountant_start_date').next('button.ui-datepicker-trigger').css("verticalAlign","middle");

  $('#accountant_birth_date').datepicker({
	showOn: 'button',
    changeYear: true,
    changeMonth: true,
    yearRange:"-60:+1"});

  $('#accountant_birth_date').next('button.ui-datepicker-trigger').css("verticalAlign","middle");

  
  $('#accountant_term_date').datepicker({
	showOn: 'button',
    changeYear: true,
    changeMonth: true,
    yearRange:"-60:+1"});

  $('#accountant_term_date').next('button.ui-datepicker-trigger').css("verticalAlign","middle"); 

  $('#accountant_spouse_birth_date').datepicker({
	showOn: 'button',
    changeYear: true,
    changeMonth: true,
    yearRange:"-60:+1"});

  $('#accountant_spouse_birth_date').next('button.ui-datepicker-trigger').css("verticalAlign","middle"); 
  
  });

  


