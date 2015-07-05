$ ->
  $("body").on "click", ".unhide-phone", (e) ->
    console.log(e + " clicked")
    $(@).parents().find('.add-phone').toggleClass('hidden')

  $("body").on "click", ".unhide-email", (e) ->
    console.log(e + " clicked")
    $(@).parents().find('.add-email').toggleClass('hidden')