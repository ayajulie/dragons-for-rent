class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dragon
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user_id, presence: true
  validates :dragon_id, presence: true
end
