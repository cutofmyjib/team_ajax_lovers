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
          console.log(response + 'you made it here 2');
        $('.survey_home').append(response);
      });//end done

  });

});






