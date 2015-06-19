
get '/surveys' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @surveys = Survey.where(user_id: @user.id)
    erb :survey
  else
    redirect '/signin'
  end
end

get '/surveys/new'  do    #request html form for new survey

  if session[:user_id]
    @user = User.find(session[:user_id])
    puts '*' * 50
    p session
    puts '*' * 50
    erb :new_survey_form
  else
    puts '*' * 50
    p "you got no session"
  end
end

post '/surveys' do        #read the form
        # survey_title = params[:title]
        @survey = Survey.create(title: params[:title],user_id: session[:user_id])

        # if @survey.save

        #   @survey_id = @survey.id
          #go to that survey
          redirect "/surveys/#{@survey.id}/edit"
        # else
        #   @errors = "no survey found"
        #   redirect '/surveys'
        # end

end

get '/surveys/:survey_id/edit' do
 @survey = Survey.find(params[:survey_id])

 @user_id = session[:user_id]

 @surveys = Survey.where(user_id: session[:user_id])
  p "hi"
  erb :survey_edit
end

# put '/surveys/:id' do #update an edited survey
#   #database update
#   redirect '/surveys/:id'
# end

get '/surveys/:survey_id' do #lists specific survey with questions
  @survey = Survey.find(params[:survey_id])
    erb :survey_edit
end

# delete '/survey/:id' do
#   #db delete survey with id
#   redirect '/list_surveys'
# end

get '/surveys/:survey_id/take' do
  @survey = Survey.find(params[:survey_id])
  erb :take_survey
end

post '/surveys/:survey_id/answers' do
    @survey = Survey.find(params[:survey_id])
user_survey_taker = User.create!(email: "email@email.com", name: "survey_taker", user_name: "survey_taker")
  #p user_survey_taker
   survey_user= SurveyUser.new(survey_id: params[:survey_id], user_id: user_survey_taker.id)
   # puts "*" * 100
  # p survey_user
    erb :thank_you_screen #redirect to a thank you page (12:09pm - e - timeboxing this shit and moving on to AJAX. Need to redirect to thank you screen and a screen that prints out to all asnwers )
end
