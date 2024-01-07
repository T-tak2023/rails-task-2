class Reservation < ApplicationRecord
  belongs_to :user
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :person, presence: true
end
