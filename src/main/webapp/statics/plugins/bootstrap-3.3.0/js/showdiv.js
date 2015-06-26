/* ========================================================================
 * Bootstrap: dropdown.js v3.3.0
 * http://getbootstrap.com/javascript/#dropdowns
 * ========================================================================
 * Copyright 2011-2014 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */


+function ($) {
  'use strict';
  var toggle ='[data-toggle="toggle"]'
  var Showdiv = function(el){
    $(el).on('click', toggle, this.toshow)
  }
  Showdiv.prototype.toshow = function(e){
    var $this=$(this)//被单击元素的jQuery对象，临时赋值，防止this污染
    var selector=$this.attr('data-target');
    $(selector).show().siblings().hide();
  }
  function Plugin(option) {
    //return this.each(function () {
    //  var $this = $(this)
    //  var data  = $this.data('target')
    //})
  }
  $.fn.showdiv=Plugin
  $(document).on('click.dbst.showdiv.data-api', toggle, Showdiv.prototype.toshow)
}(jQuery);
