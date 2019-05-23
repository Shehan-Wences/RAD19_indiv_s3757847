class Category < ApplicationRecord
  has_many :courses

  validates :name,  presence: true, length: { maximum: 100 }

end
