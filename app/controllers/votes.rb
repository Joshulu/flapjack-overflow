# post '/up_vote' do
#   Vote.new(voter_id: session[:user_id], votable_id: params[:id] , votable_type: , vote_type: )
# end

post '/questions/:id/vote' do

end

post '/answers/:id/vote' do

end

post '/comments/:id/vote' do

end

post '/votes' do
  object_type = params['object_type']
  object_id = params['object_id'].to_i
  vote_type = params['vote_type']

  puts
  puts
  puts object_id
  puts object_type
  puts vote_type
  puts

  case object_type
  when "Question"
    object = Question.find(object_id)
  when "Answer"
    object = Answer.find(object_id)
  when "Response"
    object = Response.find(object_id)
  end

  Vote.create(voter: current_user,  vote_type: vote_type, votable_type: object_type, votable: object)



  if request.xhr?
    content_type :json
    { :object_type => object_type, :vote_type => vote_type, :count => object.votes.count.to_s }.to_json
  else
    redirect "/questions/#{object_id}"
  end
end
