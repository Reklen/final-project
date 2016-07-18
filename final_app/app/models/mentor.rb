class Mentor < ActiveRecord::Base
  has_many :user_mentors
  has_many :users, through: :user_mentors

  # has_secure_password

  # def self.confirm(params)
  #   @mentor = Mentor.find_by({email: params[:email]})
  #   @mentor.try(:authenticate, params[:password])
  # end

end
