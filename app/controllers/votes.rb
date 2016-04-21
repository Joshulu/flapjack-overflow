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
  object_id = params['object_id']
  vote_type = params['vote_type']

  case object_type
  when "Question"
    question = Question.find(object_id)
  when "Answer"
    answer = Answer.find(object_id)
  when "Response"
    response = Response.find(object_id)
  end

  Vote.save(voter: current_user,  vote_type: params['vote_type'], votable_type: object_type)
end
