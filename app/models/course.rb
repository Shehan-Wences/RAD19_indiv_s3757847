class Course < ApplicationRecord
  belongs_to:user
  belongs_to:category
  has_and_belongs_to_many :locations
  has_many :votes, dependent: :destroy
  mount_uploader :picture, PictureUploader


  validates :name,  presence: true, length: { maximum: 100 },
                    uniqueness: { case_sensitive: false }
  validates :prerequisite,  presence: true
  validates :description,  presence: true, length: { maximum: 200 }
  validates :category_id,  presence: true
  validates :location_ids,  presence: true
  validates :picture,  presence: true
end
