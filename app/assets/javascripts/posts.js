
$(function(){
  $('.post-evaluation').raty({
    readOnly: true,
    half: true,
    score: function() {
      return $(this).attr('data-score');
    },
    path: '/assets/'
  });


  $('#evaluate_stars').raty({
      starOn: $('#star-on-image-tag').val(),
      starOff: $('#star-off-image-tag').val(),
      starHalf: $('#star-half-image-tag').val(),
      scoreName: 'comment[evaluation]'
  });
});


