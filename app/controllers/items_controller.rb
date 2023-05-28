class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user.nil? 
      redirect_to new_user_session_path
    elsif current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
  
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    
    if current_user.nil? || item.user_id != current_user.id
      redirect_to root_path
    else
      item.destroy
      redirect_to root_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :situation_id, :shipping_charge_id, :region_of_origin_id, :day_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
