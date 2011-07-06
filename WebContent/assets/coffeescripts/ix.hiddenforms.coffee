window.HiddenFormView = Backbone.View.extend
  events: {
    'click .show-form': 'show'
    'click .hide-form': 'hide'
  }
  show: (e) ->
    e.preventDefault()
    @$('form').slideDown 'normal', ->
      $('.actions').slideUp 'normal', ->
        $('html').scrollTo 'form', 300
  hide: (e) ->
    e.preventDefault()
    @$('form').slideUp 'normal', ->
      $('.actions').slideDown()
