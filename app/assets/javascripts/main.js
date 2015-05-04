// Fade out flash alert message
window.setTimeout(function() {
  $('#flash-alert').fadeTo(2000, 0).slideUp(500, function() {
    $(this).remove();
  });
});
