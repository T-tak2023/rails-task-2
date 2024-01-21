class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :person, presence: true, numericality: {greater_than_or_equal_to: 1}
  validate :date_check
  def date_check
    return false if check_in_date.nil? || check_out_date.nil?
    if self.check_in_date < Date.today
      errors.add(:check_in_date, "は本日以降で選択してください")
    elsif self.check_in_date >= self.check_out_date
      errors.add(:check_out_date, "はチェックイン日より後の日付を選択してください。")
    end
  end
end
