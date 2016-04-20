require 'bcrypt'

class User < ActiveRecord::Base
  has_many :votes, foreign_key: :voter_id
  has_many :responses, foreign_key: :creator_id
  has_many :questions, foreign_key: :creator_id
  has_many :answers, foreign_key: :creator_id

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

end
