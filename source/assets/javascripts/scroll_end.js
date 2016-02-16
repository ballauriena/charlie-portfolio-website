$.fn.scrollEnd = function(callback, timeout) {
  $(this).scroll(function(){
    var $this = $(this);
    if ($this.data('scrollTimeout')) {
      clearTimeout($this.data('scrollTimeout'));
    }
    $this.data('scrollTimeout', setTimeout(callback,timeout));
  });
};

$(window).scrollEnd(function(){
    if($(document).scrollTop() < 950) {
      $('a[href=#biography]').removeClass('active', 1000)
      $('a[href=#contact]').removeClass('active', 1000)
      $('a[href=#portfolio]').addClass('active', 1000)
    }
    else if($(document).scrollTop() >= 950 && $(document).scrollTop() < 2000) {
      $('a[href=#portfolio]').removeClass('active', 1000)
      $('a[href=#contact]').removeClass('active', 1000)
      $('a[href=#biography]').addClass('active', 1000)
    }
    else {
      $('a[href=#biography]').removeClass('active', 1000)
      $('a[href=#portfolio]').removeClass('active', 1000)
      $('a[href=#contact]').addClass('active', 1000)
    }
}, 250);
