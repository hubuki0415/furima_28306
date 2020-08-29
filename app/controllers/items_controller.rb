class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index  # indexアクションを定義した
    @item=Item.all
  end

  def new
    @item = Item.new
  end

  def create
    
    @item = Item.new(item_params)
    if @item.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:name,:price,:image,:category_id,:status_id,:explanation,:burden_id,:prefectures_id,:days_until_shipping_id).merge(user_id: current_user.id)
  end

  
end
