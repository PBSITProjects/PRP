$(document).on("franchises#edit:loaded franchises#new:loaded", function() {
  locale = gon.I18n;

  $.datepicker.setDefaults($.datepicker.regional[locale]);  

  $('#franchise_start_date').datepicker({
	showOn: 'button',
    changeYear: true,
    changeMonth: true,
    yearRange:"-60:+1"});

  $('#franchise_start_date').next('button.ui-datepicker-trigger').css("verticalAlign","middle");

  $('#franchise_renew_date').datepicker({
	showOn: 'button',
    changeYear: true,
    changeMonth: true,
    yearRange:"-10:+30"});

  $('#franchise_renew_date').next('button.ui-datepicker-trigger').css("verticalAlign","middle");

  $('#franchise_term_date').datepicker({
	showOn: 'button',
    changeYear: true,
    changeMonth: true,
    yearRange:"-10:+30"});

  $('#franchise_term_date').next('button.ui-datepicker-trigger').css("verticalAlign","middle");
 
  
  });

  


