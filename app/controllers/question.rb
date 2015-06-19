
get '/surveys/:survey_id/questions/new' do

  @survey = Survey.find(params[:survey_id])
  # content_type :json

  erb(:_new_question, layout: false).to_json #Why do we need to json?, What do locals do? What the fuck

  # erb :new_question
end

post '/surveys/:survey_id/questions' do

  # render new question below Survey, and above the new question button
  # question: this is where the question goes

  @question = Question.new(question: params[:question], survey_id: params[:survey_id])

  if @question.save

    erb(:_questionpost, layout: false, locals: {question: @question})

    # redirect "/surveys/#{@question.survey_id}"
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
  redirect "/surveys/#{params[:survey_id]}"
end




