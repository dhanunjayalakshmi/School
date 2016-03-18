@AttendantUtils =
  init: ->
    $('.attendant_item').click ->
      $(@).find('.fa').toggleClass('hidden')
