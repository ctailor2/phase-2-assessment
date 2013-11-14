$(document).ready(function() {
  $("#new-event").submit(function(event){
    var form = $(this);
    event.preventDefault();
    $.post("/events/new",form.serialize(), function(response){
      $(".event-listing").first().append("<li><a href=/events/" + response.id + ">" + response.name + "</li>")
    });
  })

  $("#edit").click(function(){
    $("#details input").prop("disabled", false);
  })
});
