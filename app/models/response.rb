class Response < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  belongs_to :respondable, polymorphic: true

  has_many :votes, as: :votable
end
