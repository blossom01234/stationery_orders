class OrdersController < ApplicationController
  def index
    @orders = Order.paginate(page: params[:page], per_page: 15)
  end

  def show
  end

  def update
  end

  def destroy
  end
end
