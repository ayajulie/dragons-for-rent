class Dragon < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :nickname, presence: true, uniqueness: true
  validates :size, inclusion: { in: %w[small medium large xlarge],
                                message: "%{value} is not a valid size" }
  validates :speed, inclusion: { in: %w[slow medium fast superfast],
                                 message: "%{value} is not a valid speed" }
  validates :description, length: { maximum: 500,
                                    too_long: "%{count} characters is the maximum allowed" }
  validates :country, presence: true
  has_one_attached :photo
  geocoded_by :country
  after_validation :geocode, if: :will_save_change_to_country?

  def self.search(search)
    # @ bookings = Booking.where('created_at NOT BETWEEN ? AND ?', @start_date.beginning_of_day, @end_date.end_of_day)

    if search
      where("upper(country) LIKE ?", "%#{search.upcase}%").order(:created_at).limit(6)

    else
      all.order(:created_at).limit(6)
    end
  end
end
