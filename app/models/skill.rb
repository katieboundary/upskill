class Skill < ActiveRecord::Base
  belongs_to :user
  has_many :resources
  has_many :progress_reviews

end
