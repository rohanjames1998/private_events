class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :events, foreign_key: :creator_id, dependent: :destroy
  has_many :invitations, foreign_key: :attendee_id, dependent: :destroy
  has_many :attended_events, through: :invitations, dependent: :destroy

  validates :first_name, length: { in: 3..10 }, presence: true
  validates :last_name, length: { in: 3..10 }, presence: true
end
