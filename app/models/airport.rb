class Airport < ApplicationRecord
  validates :code, presence: true
end
