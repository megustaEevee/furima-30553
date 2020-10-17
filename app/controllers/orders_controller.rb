class OrdersController < ApplicationController
  before_action :find_item , only: [:index, :create]

  def index
    @purchaser_address = PurchaserAddress.new
  end

  def create
    @purchaser_address = PurchaserAddress.new(order_params)
    if @purchaser_address.valid?
      @purchaser_address.save
      redirect_to root_path
    else 
      render action: :index
    end
  end

  private

  def find_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:purchaser_address).permit(:post_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
end
