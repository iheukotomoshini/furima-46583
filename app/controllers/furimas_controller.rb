class FurimasController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_common_resources, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_furima, only: [:edit, :update]
  before_action :check_owner, only: [:edit, :update]

  def index
    @furimas = Furima.order(updated_at: :desc)
  end

  def new
    @furima = Furima.new
  end

  def create
    @furima = Furima.new(furima_params)
    @furima.user = current_user
    if @furima.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @furima = Furima.find(params[:id])
  end

  def edit
  end

  def update
    if @furima.update(furima_params)
      redirect_to furima_path(@furima)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    furima = Furima.find(params[:id])
    furima.destroy
    redirect_to root_path
  end

  private

  def set_common_resources
    @genres = Genre.all
    @statuses = Status.all
    @fees = Fee.all
    @prefectures = Prefecture.all
    @scheduled_deliveries = ScheduledDelivery.all
  end

  def set_furima
    @furima = Furima.find(params[:id])
  end

  def check_owner
    redirect_to root_path unless @furima.user == current_user
  end

  def furima_params
    params.require(:furima).permit(:image, :title, :explanation, :category_id, :status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price)
  end
end