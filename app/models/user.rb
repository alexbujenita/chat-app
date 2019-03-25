class User < ApplicationRecord
  has_secure_password

  has_many :messages
  has_many :groups, through: :messages


  validates :name, presence: true
  validates :nickname, presence: true, uniqueness: true

end
