class Response < ActiveRecord::Base
  belongs_to :user, foreign_key: :creator_id
  has_many :votes, as: :votable
  belongs_to :respondable, polymorphic: true
end
