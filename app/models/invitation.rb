class Invitation < ApplicationRecord
  belongs_to :attendee, class_name: :User
  belongs_to :attended_event, class_name: :Event

  validates :attendee_id, uniqueness: { scope: :attended_event_id, message: "You are already invited to this event." }
end
