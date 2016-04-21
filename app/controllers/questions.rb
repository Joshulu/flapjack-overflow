get "/questions/:id" do
  @user = User.find(session[:user_id]) if session[:user_id]

  @question = Question.find(params[:id])
  @creator = User.find(@question.creator_id) # @question.creator
  @best_answer = @question.best_answer
  @answers = @question.answers
  @q_comments = @question.responses
  erb :"questions/show"
end

get '/questions' do
  @questions = Question.all
  @user = User.find(session[:user_id]) if session[:user_id]
  erb :"questions/index"
end

post '/questions' do
  question = Question.new(params[:question])
  if question.save
    redirect '/questions'
  else
    @errors = question.errors.full_messages
    erb :"/questions/index"
  end
end

post '/best_answer' do
  question = Question.find(params[:question_id])
  answer = Answer.find(params[:answer_id])
  question.best_answer = answer
  redirect "/questions/#{question.id}"
end

post '/answers' do
  answer = Answer.new(params[:answer])

  question_id = answer.question.id

  if answer.save
    redirect "/questions/#{question_id}"
  else
    @errors = answer.errors.full_messages
    erb :"/questions/#{question_id}"
  end
end

post '/responses' do
  response = Response.new(params[:response])

  if response.respondable_type == "Question"
    question_id = response.respondable_id
  else
    question_id = response.respondable.question.id
  end

  if response.save
    redirect "/questions/#{question_id}"
  else
    # @errors = response.errors.full_messages # no error display on responses yet
    erb :"/questions/#{question_id}"
  end
end
