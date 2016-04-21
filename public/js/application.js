$(document).ready(function() {
  $(".vote_box").on("submit", "form", function() {
    event.preventDefault();
    var $button = $(this);
    var data = $button.serialize();
    var verb = $button.attr("method");
    var route = $button.attr("action");

    var request = $.ajax({
      method: verb,
      url: route,
      data: data,
    });
    request.done(function(msg){
      console.log(msg);
    });
    var vote_type = $button.attr('value');
    if (vote_type == "upvote") {
    } else if (vote_type == "downvote") {
    } else {

    };
    });
});
