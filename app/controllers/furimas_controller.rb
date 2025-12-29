class FurimasController < ApplicationController
  before_action :move_to_index, only: [:new, :create, :destroy]
  def index
    @furimas = Furima.all
  end

  def new
    @furima = Furima.new
    @genres = Genre.all
    @statuses = Status.all
    @fees = Fee.all
    @prefectures = Prefecture.all
    @scheduled_deliveries = ScheduledDelivery.all
  end

  def create
    @furima = Furima.new(furima_params)
    if @furima.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @furima.destroy
    redirect_to root_path
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

  def furima_params
    params.require(:furima).permit(:image, :title, :explanation, :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price)
  end

end
