class FurimasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @furimas = Furima.order(updated_at: :desc)
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
    @furima.user = current_user
    if @furima.save
      redirect_to root_path
    else
      @genres = Genre.all
      @statuses = Status.all
      @fees = Fee.all
      @prefectures = Prefecture.all
      @scheduled_deliveries = ScheduledDelivery.all
      render :new, status: :unprocessable_entity
    end
  end

  #def show
  #  @furima = Furima.find(params[:id])
  #end

  private



  def furima_params
    params.require(:furima).permit(:image, :title, :explanation, :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price)
  end

end
