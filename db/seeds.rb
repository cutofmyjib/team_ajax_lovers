require 'faker'


15.times do |n|
  survey = Survey.new
  survey.title = Faker::Company.catch_phrase
  survey.save
end

10.times do |n|
  question = Question.new
  question.question = Faker::Lorem.sentence
  question.save
end
