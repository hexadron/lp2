$ ->

  ($ 'input[type=submit]').click (e) ->
    e.preventDefault()
    
    v2 = 
      number: 4321
      nombre: 'Dorotea'
     
    console.log v2
    
    $.post 'login/procesar',
      vaca: JSON.stringify(v2),
      (r) -> console.log r