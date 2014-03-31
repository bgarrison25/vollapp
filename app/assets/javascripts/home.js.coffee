

jQuery(document).ready ->
  "use strict"
  jQuery("#logos").bxSlider
    slideWidth: 235
    pager: false
    minSlides: 2
    maxSlides: 5
    infiniteLoop: false
    hideControlOnEnd: true
    slideMargin: 10

  jQuery("#fixture").bxSlider
    pager: false
    infiniteLoop: false
    hideControlOnEnd: true

  return
