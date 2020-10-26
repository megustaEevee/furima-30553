class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_item, only: [:kanryou, :kounyu, :edit, :update, :destroy]

  def index
    @items = Item.all.order(id: :DESC)
  end

  def show
    item = Item.where(id: params[:id])
    return redirect_to root_path if item == []
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to kanryou_item_path(@item.id)
    else
      render :new
    end
  end

  def kanryou
  end

  def kounyu
  end

  def edit
    redirect_to root_path if @item.purchaser || current_user.id != @item.user.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user.id
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end