$ ->
  $('input[type=submit]').click (e) ->
    e.preventDefault()
    $('body').empty()
    url = window.location.href
    if url.charAt url.length is not '/'
      window.location.href.append '/'
    window.location.hash = '!/recarga'

