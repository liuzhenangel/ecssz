$(document).on 'ready, page:change', ->
  $('#is_like').click ->
    $('#is_like').hide()
    $('#is_not_like').show()
    $.post '/likes', { article_id: $('#article_id').val() }, (data)->
      $('.is_not_like_count').text(data['count'])
      if $('#like_id').length == 0
        $('<input id="like_id" type="hidden" />').val(data['id']).appendTo($('.btn-like'))
      else
        $('#like_id').val(data['id'])
    false
  false

  $('#is_not_like').click ->
    $('#is_like').show()
    $('#is_not_like').hide()
    like_id = $('#like_id').val()
    $.ajax({
      url: "/likes/#{like_id}",
      type: 'DELETE',
      success: (data)->
        $('.is_like_count').text(data['count'])
    })
    false
  false

