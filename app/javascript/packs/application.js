// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';



var scrolled = false;

  function updateScroll(){
      if(!scrolled){
        console.log(scrolled)
          var element = document.getElementById("messages_box");
          if(element){
          element.scrollTop = element.scrollHeight;
        };
      }
  }
  if(document.getElementById("messages_box")){
    document.getElementById("messages_box").addEventListener('scroll', function(){
          scrolled = true;
  })
  };

import { navTabs } from '../navbar/navbar_tabs' ;
import { mapHighlights } from '../map/map_highlight' ;
import { reverseHighlights } from '../map/map_highlight' ;

import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';
import { initChatroomCable } from '../channels/chatroom_channel';
import { initFlatpickr } from '../plugins/flatpickr';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initChatroomCable();
  updateScroll();
  initFlatpickr();
  initAutocomplete();
  mapHighlights();
  reverseHighlights();
  navTabs();
  // setInterval(updateScroll,1000);
});

