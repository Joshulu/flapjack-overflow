class Response < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :votes, as: :votable
  belongs_to :respondable, polymorphic: true
end
