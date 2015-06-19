class User < ActiveRecord::Base

  has_many :answers
  has_many :survey_users
  has_many :surveys, through: :survey_users

  # users.password_hash in the database is a :string
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
