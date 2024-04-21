class Buffet < ApplicationRecord
  belongs_to :address
  has_one :address
end
