class ItemsController < ApplicationController
  before_action :basic_auth

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username,password|
      username == 'matsur2' && password == '2150'
    end
  end

  def item_params
    params.require(:item).permit(:item_name,:content,:category_id,:product_status_id,:delivery_charge_id,:prefecture_id,:shipping_days_id,:item_name,:image).merge(user_id: current_uer.id)
  end
end
