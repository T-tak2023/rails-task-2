class Room < ApplicationRecord
  mount_uploader :room_image, RoomImageUploader
  belongs_to :user
  validates :room_name, presence: true
  validates :room_introduction, presence: true
  validates :price_per_day, presence: true, numericality: {only_integer:true, greater_than_or_equal_to: 1}
  validates :room_address, presence: true

  def self.search_for(area: nil, keyword: nil)
    query = Room.all

    if area.present?
      query = query.where('room_address LIKE ?', '%' + area + '%')
    end
    
    if keyword.present?
      query = query.where('room_name LIKE ? OR room_introduction LIKE ?', '%' + keyword + '%', '%' + keyword + '%')
    end

    query
  end
end
