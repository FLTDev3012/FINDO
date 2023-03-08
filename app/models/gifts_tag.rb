class GiftsTag < ApplicationRecord
  belongs_to :gift
  belongs_to :tag
end
