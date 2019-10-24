class User < ApplicationRecord
  has_one_attached :icon
  has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
 
  has_many :tasks
  
  
end
