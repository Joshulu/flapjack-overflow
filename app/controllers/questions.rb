get '/' do
  redirect '/questions'
end

get '/questions' do
  @questions = Question.all
  erb :"questions/index"
end

get "/questions/:id" do
  @question = Question.find(params[:id])
  @user = User.find(@question.creator_id)
  @answers = @question.answers
  @q_comments = @question.responses
  erb :"questions/show"
end
