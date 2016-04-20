class Question < ActiveRecord::Base
  belongs_to :user, foreign_key: :creator_id
  has_many :votes, as: :votable
  has_many :responses, as: :respondable
  has_many :answers
end
