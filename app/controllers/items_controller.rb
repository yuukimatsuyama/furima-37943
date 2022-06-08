class ItemsController < ApplicationController
  before_action :basic_auth
  before_action :authenticate_user!,only: [:new,:edit,:destroy]
  before_action :set_item,only: [:show,:edit,:update]
  before_action :move_to_top ,only: [:edit]

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

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def show
  end

  def edit
    unless @item.user == current_user
      redirect_to root_path
    end
  end 

  def update
   if  @item.update(item_params)
      redirect_to item_path
   else
     render :edit
   end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user == current_user
      item.destroy
    end
    redirect_to root_path
  end


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username,password|
      username == 'matsur2' && password == '2150'
    end
  end

  def item_params
    params.require(:item).permit(:item_name,:content,:category_id,:product_status_id,:delivery_charge_id,:prefecture_id,:shipping_days_id,:image,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_top
    if @item.buying_item.present?
      redirect_to root_path
    end
  end
end
