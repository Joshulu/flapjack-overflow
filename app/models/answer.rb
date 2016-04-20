class Answer < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :votes, as: :votable
  belongs_to :question
  has_many :responses, as: :respondable
end
