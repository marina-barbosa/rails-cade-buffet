class Buffet < ApplicationRecord
  belongs_to :address, optional: true  
end
