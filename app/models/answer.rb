class Answer < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :question

  has_many :votes, as: :votable
  has_many :responses, as: :respondable
end
