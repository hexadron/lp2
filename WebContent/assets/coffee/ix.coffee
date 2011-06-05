TableView = Backbone.View.extend
  events: 'click th': 'sort'
  sort: (e) ->
    target = e.srcElement ? e.target
    tab = $ target
    rows = @$ 'tbody tr'
    sortClass = 'asc'
    rows = _(rows).sortBy (r) ->
      text = $($(r).children()[target.cellIndex]).text()
      if tab.hasClass 'date'
        a = _(text).words '/'
        new Date(a[2], a[1], a[0]).getTime()
      else if tab.hasClass 'numeric'
        parseInt(text)
      else
        text
    if tab.hasClass(sortClass)
      rows.reverse()
      tab.removeClass(sortClass)
    else
      tab.siblings().removeClass(sortClass)
      tab.addClass(sortClass)
    @$('tbody').empty().append(rows)

ToolbarView = Backbone.View.extend
  intialize: (options) ->
    @table = options.table
  table: ->
    @table

HiddenFormView = Backbone.View.extend
  events: {
    'click .show-form': 'show',
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
