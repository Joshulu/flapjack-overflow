class Response < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :respondable, polymorphic: true

  has_many :votes, as: :votable

  def score
    upvotes = Vote.where(vote_type: "up", votable_type: "Response", votable_id: id)
    downvotes = Vote.where(vote_type: "down", votable_type: "Response", votable_id: id)
    return  upvotes.count - downvotes.count
  end
end
