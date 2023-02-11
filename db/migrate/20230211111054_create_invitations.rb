class CreateInvitations < ActiveRecord::Migration[7.0]
  def change
    create_table :invitations do |t|
      t.timestamps
    end
    add_reference :invitations, :attendee, references: :users, index: true
    add_reference :invitations, :attended_event, references: :events, index: true
    add_foreign_key :invitations, :users, column: :attendee_id
    add_foreign_key :invitations, :events, column: :attended_event_id
  end
end
