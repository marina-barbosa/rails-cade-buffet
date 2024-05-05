class Price < ApplicationRecord
  validates :base_price_weekdays, :additional_person_price_weekdays, :extra_event_hour_price_weekdays,
            :base_price_weekend, :additional_person_price_weekend, :extra_event_hour_price_weekend, presence: true

  validates :base_price_weekdays, :additional_person_price_weekdays, :extra_event_hour_price_weekdays,
            :base_price_weekend, :additional_person_price_weekend, :extra_event_hour_price_weekend,
            numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
