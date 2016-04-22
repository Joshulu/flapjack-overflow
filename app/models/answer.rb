class Answer < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :question

  has_many :votes, as: :votable
  has_many :responses, as: :respondable

  def score
    upvotes = Vote.where(vote_type: "up", votable_type: "Answer", votable_id: id)
    downvotes = Vote.where(vote_type: "down", votable_type: "Answer", votable_id: id)
    return  upvotes.count - downvotes.count
  end
end
