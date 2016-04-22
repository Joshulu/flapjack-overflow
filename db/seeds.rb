require 'faker'

stuff = ['breakfast is the best!','You should not do that with FlapJacks','IHOP all the way!','Forks and Knives','Have you tried smooth Jazz?','Try it in your PJs','FlapJacks is Love, FlapJacks is life','Candy is a breafast food!','Waffles SUCK!','FlapJacks For the Win','No.','Nordic pancakes are similar to the French-style crêpes. In some Nordic countries, they are served with jam or fruit, especially lingonberries (or the butter from that fruit) as a dessert with a variety of savoury fillings.','American and Canadian pancakes (sometimes called hotcakes, griddlecakes, or flapjacks) are usually served at breakfast, in a stack of two or three pancakes topped with real or artificial maple syrup and butter, and often served with sides such as bacon, toast, eggs or sausage.','The earliest known pancakes were made about 12,000 years ago from ground grains and nuts, mixed with water or milk and cook on hot stones.','The record for the fastest ever Marathon run while continuously tossing a pancake is 3hr 2min 27sec by Mike Cuzzacrea in 1999.','Around 52 million eggs are used in the UK on Pancake Day, which is 22 million more than usual.','I do not know about you but when I eat about 5-6 flapjacks I go comatose','I really think that flapjacks are the most underappreciated breakfast food of all time!','Betty Crocker is my wife.']
# users
10.times do
  User.create(
    username: ['FlapjackLover', 'PancakeBake23', 'SundaySpecial', 'Denny', 'IHOP32', 'CandyMan','CanadianBacon', 'RegualrBacon', 'EggsOverHammy','BettyCrocker','Mapleman','MapleLady43','LinksForDays','FlapJackStackMaster2000','Carl','BananaPancakes'].sample,
    password: "password"
  )
end

# questions
10.times do
  Question.create(
    content: stuff.sample,
    title: ['How many pancakes is too many?','POLL: Who loves Waffle House?','How do you make the best sryup?','Do Canadians do breakfast better?','FlapJacks?','Best brands of butter?','Can I use a spoon to each FlapJacks?','What is the optimal amount of sryup?','I need help with a sryup heist at my local IHOP','Can I make FlapJacks without flour?','I am having trouble sharing my FlapJacks','Hi, I am a FlapJack addict..'].sample,
    creator: User.all.sample,
  )
end

# answers
20.times do
  Answer.create(
    content: stuff.sample,
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
22.times do
  Response.create(
    content: ['This Question is FlapJackable!','Why are you even asking this?','IHOP all the way!','Could you be more specific...','Have you tried smooth Jazz?','I dont wake up for anything less than FlapJacks','FlapJacks is Love, FlapJacks is life','Do you have any recommendations for fat-stack support groups','Waffles SUCK!','FlapJacks For the Win','No.','Your question is no good!','RESPECT THE FLAP, RESPECT IT!','WHY AM I YELLING!!?','I dont know about that, but I do know I love FlapJacks','You can never get enough cakes, Bro/Broet',].sample,
    creator: User.all.sample,
    respondable: Question.all.sample,
    respondable_type: "Question"
  )
end

# responses on answers
30.times do
  Response.create(
    content: ['Your answer really hit me hard man...',"What a great explination","If you haven't yet, you should really try and rob IHOP of all the Flapjacks","How could anyone listen to this guy..","You didn't even address the question...","You should join me on the annual FlapJack run downtown..",'No','Yes','What?',"Frankly I don't think the UK market varies that dramatically from Sweden and Australia - there's huge potential for growth, if people take the right approach.","If it were me, I would take it outside and hose it off.","Mine doesn't do that.","Everything will be fine. Better than anyone could even imagine. The FLAPJACK will prevail!!","Well, I know that I, for one, am going to eat a peanut butter cup.","No you shouldn't. You know it's just gonna start a fight. Let it go.","You might end up buring them that way!","Do not listen to this person..","Am I the only one here who likes waffles?","I too have a hard time eating Flapjacks that are perfect circles.","FIRST!","You don't even know","FLAPPPPJACKKKSSSS"].sample,
    creator: User.all.sample,
    respondable: Answer.all.sample,
    respondable_type: "Answer"
  )
end
