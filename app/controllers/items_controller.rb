class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_item, only: [:destroy,:show,:edit,:update]
  before_action :set2_item, only: [:edit,:update]
  def index  # indexアクションを定義した
    @item=Item.all.order("created_at ASC")
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
     if @item.destroy
        redirect_to root_path
    else
        render :show
   end
 end
  def show
  end

  def edit

  end

  def update
       
      if @item.update(item_params)
         redirect_to root_path
        else
          render :edit
       end
     
  end  

  private

  def item_params
    params.require(:item).permit(:name,:price,:image,:category_id,:status_id,:explanation,:burden_id,:prefectures_id,:days_until_shipping_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def set2_item
    if current_user.id == @item.user_id
     else
      render :edit
    end
 end
end
