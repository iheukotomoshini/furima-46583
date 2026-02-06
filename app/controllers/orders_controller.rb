class OrdersController < ApplicationController
before_action :authenticate_user!, only: [:index, :create]
  def new
    @purchase_menu = PurchaseMenu.new
  end

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @furima = Furima.find(params[:furima_id])
    if @furima.purchase_user.present?
      redirect_to root_path 
    end
    @purchase_menu = PurchaseMenu.new
    @prefectures = Prefecture.all
  end

  def create
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
      #redirect_to root_path 
    end
  end

  private

  def menu_params
    params.require(:purchase_menu).permit(:price, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, furima_id: params[:furima_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @furima.price, 
      card: menu_params[:token],    
      currency: 'jpy'                 
    )
  end
  
end
