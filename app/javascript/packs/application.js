// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import "jquery"
import "jquery-ui"
import "bootstrap"
import "../stylesheets/application"
import "@fortawesome/fontawesome-free/js/all";
import $ from 'jquery';

global.$ = jQuery;

require.context('../images',true, /\.(?:png|jpg|gif|ico|svg)$/)

document.addEventListener("turbolinks:load", ()=> {
	$('[data-toggle="tooltip"]').tooltip()
	$('[data-toggle="popover"]').popover()

	$( ".dropdown-submenu" ).click(function(event) {
    // stop bootstrap.js to hide the parents
    event.stopPropagation();
    // hide the open children
    $( this ).find(".dropdown-submenu").removeClass('open');
    // add 'open' class to all parents with class 'dropdown-submenu'
    $( this ).parents(".dropdown-submenu").addClass('open');
    // this is also open (or was)
    $( this ).toggleClass('open');
     });

    $("#franchise_search input").keyup(function() 
    {
      $.get($("#franchise_search").attr("action"), $("#franchise_search").serialize()+"&destination="+gon.destination,  null, "script");
      return false;
    });
	
})



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
