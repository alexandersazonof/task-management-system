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
//= require activestorage
//= require turbolinks
//= require jquery3
//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets
//= require jquery-ui/widgets/sortable
//= require rails_sortable
//= require_tree .


$(document).ready(function() {
  $("#AddButton").click(function(){
    var taskName = $('#InputTask').val()
    $.ajax({
      type: "post",
      url: "/tasks",
      data: { name: taskName }
    })
  });

  

  $(function() {
    $('.sortable').railsSortable();
  });
});

$(document).on("change", "input:checkbox", function () {
  var id = $(this).attr('id').split('-')[2];
  if (this.checked) {
    $.ajax({
      url: "/tasks/"+id,
      type: 'PATCH',
      data: { id: id }
    })
  } else {
    alert('Incorrect query');
  }
});
