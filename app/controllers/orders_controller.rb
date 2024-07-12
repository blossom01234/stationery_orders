class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update, :destroy]

  def index
    @orders = Order.paginate(page: params[:page], per_page: 15)
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end
end
