class User < ApplicationRecord
  has_many :moments

  has_secure_password
end
