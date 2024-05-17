class Event < ApplicationRecord
  belongs_to :price, optional: true
  belongs_to :buffet

  validates :name, :description, presence: true
  validates :min_people, :max_people, :default_event_duration_minutes, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :buffet_id, presence: true
end
