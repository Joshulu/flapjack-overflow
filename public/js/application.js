$(document).ready(function() {
  $(".vote-button").on("click", "button", function() {
    event.preventDefault();
    var $button = $(this);
    var vote_type = $button.attr('value')
    if (vote_type == "upvote") {

    } else if (vote_type == "downvote") {

    } else {

    };
    });
});
