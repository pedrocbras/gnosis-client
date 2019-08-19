class User < ActiveRecord::Base
  extend Devise::Models

  enum role: [:university, :research_group, :reader]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User
  has_many :registration_keys
end
