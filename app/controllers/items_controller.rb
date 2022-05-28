class ItemsController < ApplicationController
  before_action :basic_auth
  before_action :authenticate_user!,only: [:new,:edit]
  before_action :set_item,only: [:show,:edit,:update]
  before_action :ensure_user,only: [:edit,:update]

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
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
   else
     render :edit
   end
  end


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username,password|
      username == 'matsur2' && password == '2150'
    end
  end

  def item_params
    params.require(:item).permit(:item_name,:content,:category_id,:product_status_id,:delivery_charge_id,:prefecture_id,:shipping_days_id,:item_name,:image,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def ensure_user
    @items = current_user.items
    @item = Item.find(params[:id])
    redirect_to root_path
  end

end
