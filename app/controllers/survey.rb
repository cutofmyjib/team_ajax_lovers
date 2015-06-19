
get '/surveys' do
  #build a list

  erb :survey
end

get '/surveys/new'  do  #request html form for new survey
  #pass anything you need for survey id

  erb :new_survey_form
end

post '/surveys' do
        #load info from params
        #create model object
        #@survey_id = Survey.new
        #go to survey

  redirect '/surveys/#{survey_id}/edit'
end

get '/surveys/:id' do #lists specific survey with questions

  erb :display_survey
end

delete '/survey/:id' do
  #db delete survey with id
  redirect '/surveys'
end
