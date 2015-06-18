
get '/questions/new' do
    #id in url
    #build form
    erb :edit_question
end

post '/surveys/:id/questions' do
    #read params, create a new question object
    redirect '/surveys/:id'
end

get '/surveys/:id/questions/:id/edit' do
  #build the form, send to user, put id in url
  #
    erb :edit_question
end

put '/surveys/:id/questions/:id' do
  #pull params, put in database
  redirect '/surveys/:id'
end

delete '/survey/:id/questions/:id' do
  #db delete qurestion with id
  redirect '/surveys/:id'
end




