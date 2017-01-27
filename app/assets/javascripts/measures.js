// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ready', function(){
  $('#recipe-data form').on('submit', function(e) {
    e.preventDefault();
    var data = $(this).serialize();
    var url = $(this).attr("action");
    var $section = $(this).closest('#recipe-data');

    $.ajax({
      url: url,
      type: 'POST',
      data: data
    })
    .done(function(response) {
      $section.append(response);
    });

  });

});
