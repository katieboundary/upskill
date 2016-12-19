class User < ActiveRecord::Base
  include BCrypt

  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true

  has_many :skills
  has_many :resources through: :skills
  has_many :progress_reviews through: :skills


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
