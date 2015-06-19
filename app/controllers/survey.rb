
get '/surveys' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    @surveys = @user.surveys
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

