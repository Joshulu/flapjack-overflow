get '/' do
  redirect '/questions'
end

get '/questions' do
  @questions = Questions.all
  erb :questions
end
