get '/answers/new' do
    #question id in session
    #build form
    erb :edit_question
end

post '/answers' do
    #read params, create a new question object, read questions id from session
    redirect '/question/:id'
end

get '/answers/:id/edit' do
  #build and populate the edit form,
  #send to user, put questions id session

    erb :edit_question
end

put '/answers/:id' do
  #pull params, put in database, put question id from session
  redirect '/answers/:id'
end

delete '/answers/:id' do
  #db delete answer with id, get question id from session
  redirect '/question/:id'
end
