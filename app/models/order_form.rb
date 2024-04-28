class OrderForm
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :post_code, :prefecture_id, :city, :street_address, :building, :phone

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :street_address
    validates :phone, format: { with: /\A\d{10,11}\z/ }
  end

  def save
    order = Order.create(item_id:, user_id:)
    Address.create(post_code:, prefecture_id:, city:, street_address:,
                   building:, phone:, order_id: order.id)
  end
end
