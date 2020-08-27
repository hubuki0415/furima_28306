class Item <  ActiveRecord::Base
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :burden
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :days_until_shipping

  validates :name,:price,:user,:category_id,:status_id,:explanation,:burden_id,:prefectures_id,:days_until_shipping_id, presence: true
  

  validates :category_id, numericality: { other_than: 0 } 
  validates :status_id, numericality: { other_than: 0 } 
  validates :burden_id, numericality: { other_than: 0 } 
  validates :prefectures_id, numericality: { other_than: 0 } 
  validates :days_until_shipping_id, numericality: { other_than: 0 } 
end
