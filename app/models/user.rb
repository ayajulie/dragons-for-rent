class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, dependent: :destroy
  has_many :dragons, dependent: :destroy
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :description, length: { maximum: 500,
    too_long: "%{count} characters is the maximum allowed" }
  validates :role, inclusion: { in: %w(owner renter),
    message: "%{value} is not a valid" }
end
