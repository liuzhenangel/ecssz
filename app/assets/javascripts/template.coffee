$(document).on 'ready, page:change', ->
  if $('.home-title-li').css('display') == 'none'
    $('.home-title-about')[0].href = ''
  $('.home-title-about').click (event) ->
    if screen.width <= 500 || $(document).width() <= 500
      event.preventDefault()
      $('.nav-default-display-none').show()
      $('.template-navbar').css('height', '150px')
