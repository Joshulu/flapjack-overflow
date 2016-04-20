class Vote < ActiveRecord::Base
  belongs_to :user, foreign_key: :voter_id
  belongs_to :votable, polymorphic: true
end
