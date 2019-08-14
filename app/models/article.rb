class Article < ApplicationRecord
  validates :title, :body, :author, presence: true
end
