class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :wishlists_gift
  validates :user_id, uniqueness: { scope: :wishlists_gift_id }
end
