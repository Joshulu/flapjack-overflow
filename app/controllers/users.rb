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
  new_user = User.create(username: params[:username], password: params[:password])
  session[:user_id] = new_user.id
  redirect '/'
end

#** logs in user need error messages
get '/login' do
    erb :"users/login"
end


post '/login' do
  user = User.find_by(username: params[:username])
  if user.password == params[:password]
    session[:user_id] = user.id
    erb :"users/login"
  end
  redirect '/'
end
