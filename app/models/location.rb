class Location < ApplicationRecord
  has_and_belongs_to_many :courses

  validates :locationname,  presence: true, length: { maximum: 100 }

end
