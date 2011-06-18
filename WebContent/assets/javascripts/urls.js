(function() {
  $(function() {
    return $('input[type=submit]').click(function(e) {
      var url;
      e.preventDefault();
      $('body').empty();
      url = window.location.href;
      if (url.charAt(url.length === !'/')) {
        window.location.href.append('/');
      }
      return window.location.hash = '!/recarga';
    });
  });
}).call(this);
