# removes user from session
get '/logout' do
  session.delete(:user_id)
  redirect "/"
end

# takes you to signup form page
get '/users/new' do
  erb :"users/new"
end

# creates new user with post request
post '/users' do
  user = User.new(username: params[:username], password: params[:password])

  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :"users/new"
  end
end

get '/login' do
    erb :"users/login"
end


post '/login' do
  user = User.find_by(username: params[:username])

  if user.password == params[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    @errors = ["You've stacked too high my friend."]
    erb :"users/login"
  end
end
