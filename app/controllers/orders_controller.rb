class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]

    if user_signed_in?
      redirect_to root_path if current_user == @item.user || @item.order != nil
    else
      redirect_to new_user_session_path
    end
    @orderform = OrderForm.new
  end

    def create
    @orderform = OrderForm.new(order_params)
    if @orderform.valid?
      pay_item
      @orderform.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :city, :street_address, :building, :phone).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end