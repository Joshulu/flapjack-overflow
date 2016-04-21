require 'faker'

# users
10.times do
  User.create(
    username: Faker::Cat.name,
    password: "password"
  )
end

# questions
20.times do
  Question.create(
    content: Faker::Shakespeare.hamlet_quote,
    title: Faker::Shakespeare.romeo_and_juliet_quote,
    creator: User.all.sample,
  )
end

# answers
60.times do
  Answer.create(
    content: Faker::Hacker.phrases.sample,
    creator: User.all.sample,
    question: Question.all.sample
  )
end

# set best answers
10.times do
  question = Question.all.sample
  question.update(
    best_answer: Answer.where(question: question).sample
  )
end

# responses on questions
20.times do
  Response.create(
    content: Faker::Hacker.say_something_smart,
    creator: User.all.sample,
    respondable: Question.all.sample,
    respondable_type: "Question"
  )
end

# responses on answers
60.times do
  Response.create(
    content: Faker::Hacker.say_something_smart,
    creator: User.all.sample,
    respondable: Answer.all.sample,
    respondable_type: "Answer"
  )
end
