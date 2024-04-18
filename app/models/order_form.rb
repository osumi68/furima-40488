class OrderForm
  include ActiveModel::Model
  attr_accessor :token, :item_id, :user_id, :post_code, :prefecture_id, :city, :street_adress, :building, :phone

  with_options presence: true do
    validates :token
    validates :item_id
    validates :user_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: {other_than: 1}
    validates :city
    validates :street_adress
    validates :phone, format: { with: /\A\d{10,11}\z/}
  end

  def save(params,user_id)
    order = Order.create(item_id: params[:item_id].to_i, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, street_address: street_address, building: building, phone: phone, order_id: order.id)
  end
end