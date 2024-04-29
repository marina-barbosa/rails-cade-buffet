class Buffet < ApplicationRecord
  belongs_to :address, optional: true
  has_many :eventos  
end
