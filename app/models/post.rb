class Post < ApplicationRecord
  # belongs_to :user
  has_many :comments
  validates :content, length: { maximum: 140 },presence: true
  validates :title, length: { maximum: 20 },presence: true
end
