class Room < ApplicationRecord
  mount_uploader :room_image, RoomImageUploader
  belongs_to :user
  validates :room_name, presence: true
  validates :room_introduction, presence: true
  validates :price_per_day, presence: true, numericality: {only_integer:true, greater_than_or_equal_to: 1}
  validates :room_address, presence: true
end
