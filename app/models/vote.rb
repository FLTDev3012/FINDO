class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :wishlists_gift
end
