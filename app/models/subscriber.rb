class Subscriber < ApplicationRecord
  has_many :author_subscribers
  has_many :authors, through: :author_subscribers
end
