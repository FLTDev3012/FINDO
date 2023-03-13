class Gift < ApplicationRecord
  has_many :reviews, dependent: :destroy
  # has_one_attached :gift_photo
  # has_many :wishlists, dependent: :destroy
end
