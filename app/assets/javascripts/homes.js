$(document).ready(function () {
  $("#theTarget").skippr({
    transition : 'fade',
    speed : 1000,
    easing : 'easeOutQuart',
    navType : 'bubble',
    childrenElementType : 'div',
    arrows : false,
    autoPlay : true,
    autoPlayDuration : 2000,
    keyboardOnAlways : true,
    hidePrevious : false
  });
});