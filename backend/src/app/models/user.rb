class User < ApplicationRecord
  has_secure_password

  has_many :articles, dependent: :destroy
  has_many :albums, dependent: :destroy
  has_many :images, dependent: :destroy
end
