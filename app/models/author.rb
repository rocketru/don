class Author < ApplicationRecord
  has_many :author_posts
  has_many :author_subscribers
  has_many :subscribers, through: :author_subscribers
end
