class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index,:create]

  



  def index
    @purchase_address = PurchaseAddress.new
    if  current_user.id == @item.user_id || @item.purchase.present?
     
     redirect_to root_path
    end 
     
  end

  def create
  

    @purchase_address=PurchaseAddress.new(purchases_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      return redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render 'index'
    end
  end



  private

  def item_params
    params.require(:item).permit(:name,:price,:image,:category_id,:status_id,:explanation,:burden_id,:prefectures_id,:days_until_shipping_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
  
  def purchases_params
    params.require(:purchase_address).permit(:postal_code,:phone_number,:municipalities,:street_addresses,:building_name,:purchase_id,:prefectures_id,:token).merge(user_id: current_user.id).merge(item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchases_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
