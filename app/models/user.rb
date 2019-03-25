class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :nickname, presence: true, uniqueness: true

end
