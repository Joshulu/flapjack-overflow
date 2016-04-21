$(document).ready(function() {
  $('vote-button').on('click', 'button', function() {
    event.preventDefault();
    $button = $(this);
    console.log($(this));
  });
});
