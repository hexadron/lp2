(function() {
  window.TableView = Backbone.View.extend({
    events: {
      'click th': 'sort',
      sort: function(e) {
        var rows, sortClass, tab, target, _ref;
        target = (_ref = e.srcElement) != null ? _ref : e.target;
        tab = $(target);
        rows = this.$('tbody tr');
        sortClass = 'asc';
        rows = _(rows).sortBy(function(row) {
          var a, text;
          text = row.children[target.cellIndex].innerText;
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
}).call(this);
