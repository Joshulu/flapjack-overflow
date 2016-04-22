class Question < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :best_answer, class_name: "Answer"

  has_many :votes, as: :votable
  has_many :responses, as: :respondable
  has_many :answers

  def score
    upvotes = Vote.where(vote_type: "up", votable_type: "Question", votable_id: id)
    downvotes = Vote.where(vote_type: "down", votable_type: "Question", votable_id: id)
    return  upvotes.count - downvotes.count
  end
end
