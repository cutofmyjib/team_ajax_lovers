get '/surveys' do
  #build a list
  #session has user id
  @user = User.find(session[:user_id])
  @surveys = @user.surveys
  erb :display_survey
end

get '/surveys/new'  do    #request html form for new survey

  @user = User.find(session[:user_id])
  erb :new_survey_form
end

post '/surveys' do        #read the form
        #load info from params
        #create model object
        #@survey_id = Survey.new
        #go to that survey

  redirect '/surveys/#{survey_id}/edit'
end

get '/surveys/#{survey_id}/edit'
  #build & put up the edit form
  erb :
end

put '/surveys/:id' do

end
get '/surveys/:id' do #lists specific survey with questions
    session[:survey_id] = params[:id]
  erb :display_survey
end

delete '/survey/:id' do
  #db delete survey with id
  redirect '/surveys'
end
