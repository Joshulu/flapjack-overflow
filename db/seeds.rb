require 'faker'

# users
8.times do
  User.create(
    username: ['FlapjackLover', 'PancakeBake23', 'SundaySpecial', 'Denny', 'IHOP32', 'CandyMan','CanadianBacon', 'RegualrBacon', 'EggsOverHammy'].sample,
    password: "password"
  )
end

# questions
8.times do
  Question.create(
    content: Faker::Shakespeare.hamlet_quote,
    title: ['How many pancakes is too many?','POLL: Who loves Waffle House?','How do you make the best sryup?','Do Canadians do breakfast better?','FlapJacks?','Best brands of butter?','Can I use a spoon to each FlapJacks?','What is the optimal amount of sryup?'].sample,
    creator: User.all.sample,
  )
end

# answers
20.times do
  Answer.create(
    content: ['breakfast is the best!','You should not do that with FlapJacks','IHOP all the way!','Forks and Knives','Have you tried smooth Jazz?','Try it in your PJs','FlapJacks is Love, FlapJacks is life','Candy is a breafast food!','Waffles SUCK!','FlapJacks For the Win','No.'].sample,
    creator: User.all.sample,
    question: Question.all.sample
  )
end

# set best answers
8.times do
  question = Question.all.sample
  question.update(
    best_answer: Answer.where(question: question).sample
  )
end

# responses on questions
10.times do
  Response.create(
    content: ['breakfast is the best!','You should not do that with FlapJacks','IHOP all the way!','Forks and Knives','Have you tried smooth Jazz?','Try it in your PJs','FlapJacks is Love, FlapJacks is life','Candy is a breafast food!','Waffles SUCK!','FlapJacks For the Win','No.','Your question is no good!'].sample,
    creator: User.all.sample,
    respondable: Question.all.sample,
    respondable_type: "Question"
  )
end

# responses on answers
60.times do
  Response.create(
    content: ['breakfast is the best!','You should not do that with FlapJacks','IHOP all the way!','Forks and Knives','Have you tried smooth Jazz?','Try it in your PJs','FlapJacks is Love, FlapJacks is life','Candy is a breafast food!','Waffles SUCK!','FlapJacks For the Win','No.'].sample,
    creator: User.all.sample,
    respondable: Answer.all.sample,
    respondable_type: "Answer"
  )
end
