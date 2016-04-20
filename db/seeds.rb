require 'faker'

20.times do
  User.create(username: Faker::Cat.name, password: "password")
end

# User.populate 20 do |user|
#   user.username = Faker::Cat.name
#   user.password_hash = "password"
# end

20.times do
  Question.create(creator_id: (1..20).to_a.sample, content: Faker::Shakespeare.hamlet_quote, title: Faker::Shakespeare.romeo_and_juliet_quote)
end

# Question.populate 30 do |question|
#   question.creator_id = (1..20).to_a.sample
#   question.content = Faker::Shakespeare.hamlet
#   question.title = Faker::Shakespeare.romeo_and_juliet_quote
# end

40.times do
  Response.create(
    creator_id: (1..20).to_a.sample,
    content: Faker::Hacker.say_something_smart,
    respondable_id: Question.all.sample.id,
    respondable_type: "question")
    # respondable: Question.all.sample,
    # respondable_type: "question")
end

# Response.populate 40 do |response|
#   response.creator_id = (1..20).to_a.sample
#   response.content = Faker::Hacker.say_something_smart
#   response.respondable = Question.all.sample
#   response.respondable_type = "question"
# end

30.times do
  Answer.create(creator_id: (1..20).to_a.sample, content: Faker::Hacker.phrases, question_id: Question.all.sample)
end

# Answer.populate 30 do |answer|
#   answer.creator_id = (1..20).to_a.sample
#   answer.content = Faker::Hacker.phrases
#   answer.question = Question.all.sample
# end

40.times do
  Response.create(creator_id: (1..20).to_a.sample, content: Faker::Hacker.say_something_smart, respondable_id: Answer.all.sample.id, respondable_type: "answer")
end

# Response.populate 40 do |response|
#   response.creator_id = (1..20).to_a.sample
#   response.content = Faker::Hacker.say_something_smart
#   response.respondable = Answer.all.sample
#   response.respondable_type = "answer"
# end
