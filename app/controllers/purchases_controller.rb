class PurchasesController < ApplicationController
  attr_accessor :token
  def index
    @purchase_address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  
  def purchase_params
    @item = Item.find(params[:item_id])
    params.require(:purchase_address).permit(:postal_code, :city_town_village, :address, :building, :shipping_origin_id, :phone_number, ).merge(user_id: current_user.id, item_id: @item.id).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
end


