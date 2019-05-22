class Course < ApplicationRecord
  belongs_to:user
  belongs_to:category
  has_and_belongs_to_many :locations
  has_many :votes, dependent: :destroy
  mount_uploader :picture, PictureUploader
end
