class User < ActiveRecord::Base
  include BCrypt

  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

  # validates_presence_of :first_name
  # validates_presence_of :last_name
  # validates_presence_of :username
  # validates_uniqueness_of :username
  # validates_presence_of :password
  # validates_presence_of :email
  # validates_uniqueness_of :email


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(params={})
    user = self.find_by(email: params[:email])
    return user if user && user.password == params[:password]
    nil
  end
end
