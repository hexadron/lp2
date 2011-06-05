(function() {
  var HiddenFormView, TableView, ToolbarView;
  TableView = Backbone.View.extend({
    events: {
      'click th': 'sort',
      sort: function(e) {
        var rows, sortClass, tab, target, _ref;
        target = (_ref = e.srcElement) != null ? _ref : e.target;
        tab = $(target);
        rows = this.$('tbody tr');
        sortClass = 'asc';
        rows = _(rows).sortBy(function(r) {
          var a, text;
          text = $($(r).children()[target.cellIndex]).text();
          if (tab.hasClass('date')) {
            a = _(text).words('/');
            return new Date(a[2], a[1], a[0]).getTime();
          } else if (tab.hasClass('numeric')) {
            return parseInt(text);
          } else {
            return text;
          }
        });
        if (tab.hasClass(sortClass)) {
          rows.reverse();
          tab.removeClass(sortClass);
        } else {
          tab.siblings().removeClass(sortClass);
          tab.addClass(sortClass);
        }
        return this.$('tbody').empty().append(rows);
      }
    }
  });
  ToolbarView = Backbone.View.extend({
    intialize: function(options) {
      return this.table = options.table;
    },
    table: function() {
      return this.table;
    }
  });
  HiddenFormView = Backbone.View.extend({
    events: {
      'click .show-form': 'show',
      'click .hide-form': 'hide'
    },
    show: function(e) {
      e.preventDefault();
      return this.$('form').slideDown('normal', function() {
        return $('.actions').slideUp('normal', function() {
          return $('html').scrollTo('form', 300);
        });
      });
    },
    hide: function(e) {
      e.preventDefault();
      return this.$('form').slideUp('normal', function() {
        return $('.actions').slideDown();
      });
    }
  });
}).call(this);
