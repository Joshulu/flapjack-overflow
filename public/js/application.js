$(document).ready(function() {
  $(".question_page").on("submit", ".vote_box form", function() {
    event.preventDefault();
    var $button = $(this);
    var data = $button.serialize();
    var verb = $button.attr("method");
    var route = $button.attr("action");
    var closest = $button.parent().find('.vote_number')

    var request = $.ajax({
      method: verb,
      url: route,
      data: data,
    });
    request.done(function(msg){
      var vote_count = parseInt(msg["count"]);
      var vote_type = msg['vote_type'];
      var object_type = msg['object_type'];

      if (object_type == "Question"){
        var $vote = $(`.question_post .vote_box`);
      } else if (object_type == "Answer"){
        var $vote = $(`.answers .vote_box`);
      } else {
        var $vote = $(`.comments .vote_box`);
      };

      var submit_button = $vote.get(0)[4];

      // $vote.find(`${submit_button}`).css("color", "red");

      closest.text(vote_count);
    });
  });
});
