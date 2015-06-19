
get 'surveys/:survey_id/questions/new' do
    #id in url
    #build form
    erb :edit_question
end

get '/questions/:id/edit' do
  #build the form, send to user, put id in url
  #
    erb :edit_question
end

post '/surveys/:survey_id/questions' do
    #read params, create a new question object
    redirect '/surveys/:id'
end

put '/surveys/:survey_id/questions/:id' do
  #pull params, update  database
  redirect '/surveys/:id'
end

delete '/surveys/:survey_idgit /questions/:id' do
  #db delete qurestion with id
  redirect '/surveys/:id'
end




