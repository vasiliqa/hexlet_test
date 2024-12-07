class User < ApplicationRecord
  has_many :posts
  has_many :comments, class_name: "PostComment"
  has_many :post_likes
  has_many :liked_posts, through: :post_likes, source: :post

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
