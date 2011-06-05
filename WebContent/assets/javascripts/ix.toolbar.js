(function() {
  var ToolbarView;
  ToolbarView = Backbone.View.extend({
    intialize: function(options) {
      return this.table = options.table;
    },
    table: function() {
      return this.table;
    }
  });
}).call(this);
