get '/' do
  redirect '/questions'
end

get "/questions/:id" do
  @question = Question.find(params[:id])
  @user = User.find(@question.creator_id)
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
