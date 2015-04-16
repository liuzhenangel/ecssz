$(document).on 'ready, page:change', ->
  if $('.home-title-li').css('display') == 'none'
    $('.home-title-about')[0].href = ''
  $('.home-title-about').click (event) ->
    if screen.width <= 500 || $(document).width() <= 500
      event.preventDefault()
      $('.nav-default-display-none').show()
      $('.template-navbar').css('height', '150px')

  $('.circle').click ->
    if location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname
      target = $(this.hash)
      target = $('[name=' + this.hash.slice(1) +']') if !target.length
      if target.length
        $('html,body').animate({
          scrollTop: target.offset().top
        }, 1000)
        return false
