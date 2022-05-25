class ItemsController < ApplicationController
  before_action :basic_auth
  before_action :authenticate_user!,only: [:new]

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
   else
     render :new
   end
  end


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username,password|
      username == 'matsur2' && password == '2150'
    end
  end

  def item_params
    params.require(:item).permit(:item_name,:content,:category_id,:product_status_id,:delivery_charge_id,:prefecture_id,:shipping_days_id,:item_name,:image).merge(user_id: current_user.id)
  end
end
