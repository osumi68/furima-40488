class Item < ApplicationRecord
  validates :name, presence: { message: "can't be blank" }
  validates :image, presence: { message: "can't be blank" }
  validates :description, presence: { message: "can't be blank" }
  validates :category_id, numericality: { only_integer: true, other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { only_integer: true, other_than: 1, message: "can't be blank" }
  validates :shipping_free_burden_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_day_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one_attached :image
  has_one :order
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :condition
  belongs_to :shipping_free_burden
  belongs_to :shipping_day
end
