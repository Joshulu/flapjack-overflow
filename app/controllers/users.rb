# removes user from session
get '/logout' do
  session.delete(:user_id)
  redirect "/"
end
