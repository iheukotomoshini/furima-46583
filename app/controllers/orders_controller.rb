class OrdersController < ApplicationController

  def new
    @purchase_menu = PurchaseMenu.new
  end

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @furima = Furima.find(params[:furima_id])
    @purchase_menu = PurchaseMenu.new
    #@furima = Furima.find(params[:purchase_user_id])
    @prefectures = Prefecture.all
  end

  def create
    #binding.pry
    @furima = Furima.find(params[:furima_id])
    @purchase_menu = PurchaseMenu.new(menu_params)
    @prefectures = Prefecture.all;
    if @purchase_menu.valid?
      pay_item
      @purchase_menu.save
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end

  private

  def menu_params
    #params.require(:purchase_menu).permit(@furima.price).merge(token: params[:token]).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, furima_id: params[:furima_id])
    params.require(:purchase_menu).permit(:price, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, furima_id: params[:furima_id], token: params[:token])
    #params.require(:purchase_menu).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, furima_id: params[:furima_id])
    #params.require(:purchase_menu).permit(@furima.price).merge(token: params[:token])
  end

  def pay_item
    #binding.pry
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @furima.price, 
      #amount: menu_params[:price],
      card: menu_params[:token],    
      currency: 'jpy'                 
    )
  end
  
end
