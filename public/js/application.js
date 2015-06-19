$(document).ready(function () {

  // Optional - Use AJAX to send an HTTP DELETE request for the sign-out link

  $('.container').on('focusout', '.answer-style', function(event) {
    // console.log(event);
    var node = $(this).parent();
    node.animate({opacity: 0.0,},
      'slow', function() { node.hide();});
  })
   $('.container').on('click', '#take-submit', function(event) {
      console.log(event);
  //   //var node = $(this).parent();
     var node1 = $('#survey-questions');
     var node2 = $('#thanks');

     node1.animate({opacity: 0.0,},
       'slow', function() { node1.hide();});

     node2.animate({opacity: 1.0,},
       'slow');
      })

    // var focusOutListener = function() {
    //   $()
    // }

  $('.container').on('click', '#new_survey_link', function(event) {
      event.preventDefault();
       // $(this).hide();
       var form_node = $('#invisible_survey_form');
            console.log(event);

       form_node.show();
    // var node = $(this).parent();
    // node.animate({opacity: 0.0,},
    //   'slow', function() { node.hide();});
  })

});
