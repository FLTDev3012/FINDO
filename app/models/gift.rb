class Gift < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :gifts_tags, dependent: :destroy
  has_many :tags, through: :gifts_tags
  # has_one_attached :gift_photo
  # has_many :wishlists, dependent: :destroy
end
