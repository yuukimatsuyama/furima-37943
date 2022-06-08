class BuyingItemsController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!,only: [:index]
  before_action :move_to_top ,only: [:index]

  def index
    if @item.user == current_user
      redirect_to root_path
    end
    @buying_item_shipping = BuyingItemShipping.new
  end

  def create
    @buying_item_shipping = BuyingItemShipping.new(buying_item_params)
    if @buying_item_shipping.valid?
       pay_item
       @buying_item_shipping.save
       redirect_to root_path
    else
     render :index
    end
  end

  private
  def buying_item_params
    params.require(:buying_item_shipping).permit(:address_number,:prefecture_id,:municipality,:address,:building_name,:phone_number,:buying_item_id).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_top
    if @item.buying_item.present?
      redirect_to root_path
    end
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount:@item.price,
        card:buying_item_params[:token],
        currency: 'jpy'
      )
  end
end