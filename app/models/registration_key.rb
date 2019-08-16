class RegistrationKey < ApplicationRecord
  bleongs_to :user
  validates_presence_of :combination
end
