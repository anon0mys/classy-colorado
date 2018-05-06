class Post < ApplicationRecord
  validates_presence_of :title, :body
  belongs_to :author, :class_name => 'User'

  enum status: %w[standard featured]
end
