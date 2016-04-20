get '/' do
  redirect '/questions'
end

get '/questions' do
  @questions = Questions.all
  erb :"questions/index"
end

get "questions/:id" do
  @question = Question.find(params[:id])
  erb :"questions/show"
end
