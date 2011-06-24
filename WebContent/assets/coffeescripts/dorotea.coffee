$ ->
  ($ 'input[type=submit]').click ->
    $.post "login/procesar",
      ajax : true,
      (r) -> console.log r
    false
