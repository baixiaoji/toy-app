class Micropost < ApplicationRecord
    validates :context, length: { maximum: 140 }
end
