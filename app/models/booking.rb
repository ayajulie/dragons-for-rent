class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dragon
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :user_id, presence: true
  validates :dragon_id, presence: true


  def update_status
    if (self.end_date.to_date - Date.today) < 0
      return "done"
    elsif (self.start_date.to_date - Date.today) > 0
      return "pending"
    else
      return "current"
    end
  end

end
