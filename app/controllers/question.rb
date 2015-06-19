
get '/surveys/:survey_id/questions/new' do

  @survey = Survey.find(params[:survey_id])
  erb :new_question
end

post '/surveys/:survey_id/questions' do
  @question = Question.new(question: params[:question], survey_id: params[:survey_id])
  p "*" * 100
  p params

  if @question.save
    redirect "/surveys/#{@question.survey_id}"
  else
    @errors = "Your question did not save!"
    @survey = Survey.find(params[:survey_id])
    erb :new_question
  end
end

get '/surveys/:survey_id/questions/:question_id/edit' do

  @question = Question.find(params[:question_id])
  @survey = Survey.find(params[:survey_id])
  erb :edit_question
end

put '/surveys/:survey_id/questions/:question_id' do
  question = Question.find(params[:question_id])

  @updated = question.update_attributes(question: params[:question])

  redirect "/surveys/#{params[:survey_id]}"

end

delete '/surveys/:survey_id/questions/:question_id' do
  @question = Question.find(params[:question_id])

  @question.destroy
  redirect '/surveys/:id'
end




