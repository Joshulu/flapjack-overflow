class Question < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :best_answer, class_name: "Answer"

  has_many :votes, as: :votable
  has_many :responses, as: :respondable
  has_many :answers
end
