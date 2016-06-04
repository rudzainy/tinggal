class User < ActiveRecord::Base

  has_many :list_users
  has_many :tags
  has_secure_password
end