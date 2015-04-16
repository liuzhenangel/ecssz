$(document).on 'ready, page:change', ->
  if location.pathname == '/search'
    $('.form-control').css('width', 'auto')
    $('.form-control').css('border', '1px solid #DDD')
    $('.form-group').css('display', 'inline-block')
    if screen.width <= 500 || $(document).width() <=500
      $('.nav.navbar-nav.home-title').css('display', 'none')
    $('.btn-close').css('transform', 'none')
    $('.form-control').val(location.search.split('&q=')[1])

  $('.btn-search').click ->
    $('.form-control').css('width', 'auto')
    $('.form-control').css('border', '1px solid #DDD')
    $('.form-group').css('display', 'inline-block')
    $('.btn-close').css('transform', 'none')
    if screen.width <= 500 || $(document).width() <= 500
      $('.nav.navbar-nav.home-title').css('display', 'none')
      $('.nav-default-display-none').css('display', 'none')

  $('.btn-close').click ->
    $('.form-control').css('width', '0')
    $('.form-control').css('border', 'none')
    $('.form-group').css('display', 'none')
    $('.btn-close').css('transform', 'scale(0, 0)')
    $('.nav.navbar-nav.home-title').css('display', 'inline-block')

