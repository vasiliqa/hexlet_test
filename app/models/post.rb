# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :comments, class_name: 'PostComment', dependent: :destroy
  has_many :likes, class_name: 'PostLike', dependent: :destroy
  has_many :liked_users, through: :likes, source: :user, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :category, presence: true
end
