class User < ApplicationRecord
  has_secure_password

  enum role: ["default", "admin"]

  validates_uniqueness_of :username
end
