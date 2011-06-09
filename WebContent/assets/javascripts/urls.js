(function() {
  $(function() {
    return $('input[type=submit]').click(function(e) {
      e.preventDefault();
      $('body').empty();
      return window.location.hash = '!/recarga';
    });
  });
}).call(this);
