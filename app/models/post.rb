class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, class_name: "PostComment", dependent: :destroy
  has_many :post_likes, dependent: :destroy
  has_many :liked_users, through: :post_likes, source: :user

  validates :title, presence: true
  validates :body, presence: true
  validates :category, presence: true
end
