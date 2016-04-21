get '/' do
  redirect '/questions'
end

get "/questions/:id" do
  @user = User.find(session[:user_id]) if session[:user_id]

  @question = Question.find(params[:id])
  @creator = User.find(@question.creator_id)
  @answers = @question.answers
  @q_comments = @question.responses
  erb :"questions/show"
end

get '/questions' do
  @questions = Question.all
  erb :"questions/index"
end

post '/questions' do
  question = Question.new(params[:question])
  if question.save
    redirect '/questions'
  else
    @errors = question.errors.full_messages
    erb :"questions/index"
  end
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
