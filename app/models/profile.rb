class Profile < ApplicationRecord

  has_one_attached :icon
 
  validates :icon, presence: true
end