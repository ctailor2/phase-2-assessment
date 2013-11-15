$(document).ready(function() {
  $("#new-event").submit(function(event){
    var form = $(this)
    event.preventDefault()
    $.post("/events/new",form.serialize(), function(response){
      $(".event-listing").append("<li><a href=/events/" + response.id + ">" + response.name + "</li>")
    })
  })

  $("#edit").click(function(event){
    event.preventDefault()
    $("#details input").prop("disabled", false)
    $(this).hide()
    $("#cancel-edit").show()
    $("#update").show()
  })

  $("#cancel-edit").click(function(event){
    event.preventDefault()
    $("#details input").prop("disabled", true)
    $(this).hide()
    $("#update").hide()    
    $("#edit").show()
  })

  $("#create-event").click(function(event){
    $(".new-event").show()
    $(this).hide()
    $("#hide-create-event").show()
  })

  $("#hide-create-event").click(function(event){
    $(".new-event").hide();
    $(this).hide();
    $("#create-event").show();
  })

})
