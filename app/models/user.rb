class User < ActiveRecord::Base
  has_many :answers
  has_many :survey_users
  has_many :surveys, through: :survey_users
end
