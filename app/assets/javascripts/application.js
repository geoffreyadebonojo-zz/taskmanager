// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require activestorage
//= require_tree .

// var notice = document.querySelector('#notice');
// setTimeout(function(){ notice.innerHTML="<br>"; }, 7000);

// var search = document.querySelector('#video-search-input');
// var button = document.querySelector('#video-search-button');
// button.addEventListener('click', function(){
//   var title = search.value;
// });

$( document ).ready(function() {

  $('#open-new-notes').click(function() {
    $('#new-notes').toggle();
  });

  $('#hide-upper-page').click(function() {
    $('#upper-page').toggle();
  });

  $('#hide-upper-page').click(function () {
      $('#video').toggleClass("active");
  });

});
