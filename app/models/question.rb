class Question < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :votes, as: :votable
  has_many :responses, as: :respondable
  has_many :answers
end
