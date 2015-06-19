
get 'surveys/:survey_id/questions/new' do

  @survey = Survey.find(params[:survey_id])

  erb :new_question
end

post 'surveys/:survey_id/questions' do
  @question = Question.new(params[:question])

  if @question.save
    redirect '/surveys/<%= @question.survey_id %>'
  else
    @errors = "Your question did not save!"
    @survey = Survey.find(params[:survey_id])
    erb :new_question
  end
end

get '/surveys/:survey_id/questions/:question_id/edit' do

  @question = Question.find(params[:question_id])

  erb :edit_question
end

put '/surveys/:survey_id/questions/:question_id' do

  @question = Question.update_attributes(params[:question])

  redirect '/surveys/<%= @question.survey_id %>/questions'

end

delete '/surveys/:survey_id/questions/:question_id' do
  @question = Question.find(params[:question_id])

  @question.destroy

  redirect '/surveys/:id'
end




