// var clickListener = function(clickTarget) {
//   $('.survey_home').on('click', clickTarget, function(event) {
//     event.preventDefault();
//     console.log("winning");

//     // debugger
//   })
// }

$(document).ready(function () {



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






