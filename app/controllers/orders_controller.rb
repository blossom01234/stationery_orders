class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update, :destroy]
  before_action :set_order_detail, only: [:edit]

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

    def set_order_detail
      @order_details = OrderDetail.where("order_id = ?", params[:id])
    end
end
