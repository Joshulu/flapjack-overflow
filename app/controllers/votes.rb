
post '/votes' do
  object_type = params['object_type']
  object_id = params['object_id'].to_i
  vote_type = params['vote_type']

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
    { :object_type => object_type, :vote_type => vote_type, :count => object.score.to_s }.to_json
  else
    redirect "/questions/#{object_id}"
  end
end
