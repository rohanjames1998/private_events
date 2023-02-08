class Event < ApplicationRecord
  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  validates :title, length: { in: 1..15 }, presence: true
  validates :date, presence: true
  validates :desc, length: { in: 20..250 }, presence: true
  validates :country, length: { in: 3..56 }, presence: true
  validates :city, length: { in: 3..85 }, presence: true
  validates :starting_time, presence: true
  validates :ending_time, presence: true
  validates_associated :creator
end
