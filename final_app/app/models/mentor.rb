class Mentor < ActiveRecord::Base
  attr_accessor :user_t

  has_many :students
  has_many :users, through: :pairs

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true

  # validates_confirmation_of :password

def password=(unencrypted_password)
  @password = unencrypted_password
  self.password_digest = BCrypt::Password.create(@password)
end

def password
  @password
end

def full_name
  "#{first_name} #{last_name}"
end

def authenticate(unencrypted_password)
  BCrypt::Password.new(self.password_digest) == unencrypted_password ? self : false

end

  def self.confirm(params)
    @mentor = Mentor.find_by({email: params[:email]})
    @mentor.try(:authenticate, params[:password])
  end
end