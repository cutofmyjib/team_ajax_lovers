// var clickListener = function(clickTarget) {
//   $('.survey_home').on('click', clickTarget, function(event) {
//     event.preventDefault();
//     console.log("winning");

//     // debugger
//   })
// }

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



  $('#new_question').on("click", function(event){
      event.preventDefault();

      //This is the new question get route
      var path = $('#new_question').attr('href');
      console.log('you made it here 1');
      var request = $.ajax({
        url: path,
        type: "GET",
        dataType: "json"
      });//end ajax

       //Adds new question div
      request.done(function(response) {
          // console.log(response + 'you made it here 2');
        $('.survey_home').append(response);
      });//end done

  });

  $('.survey_home').on("click", '#save_new_question', function(event){
       event.preventDefault();

       var path = $(this).parent().attr('action')

       var request = $.ajax({
         url: path,
         type: "POST",
         data: $('#newquestion').serialize(),
       });//end ajax

       request.done(function(response){
        $('.save_new_question').append(response);
       })

  });

  // clickListener('#new_question');
  // clickListener('#save_new_question');


});






