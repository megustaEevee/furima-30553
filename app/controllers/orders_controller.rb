class OrdersController < ApplicationController
  def index
    @purchaser_address = PurchaserAddress.new
    @item = Item.find(params[:item_id])
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

  def order_params
    params.require(:purchaser_address).permit(:post_code, :prefecture, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: item.id)
  end
end
