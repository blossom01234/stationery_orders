class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update, :destroy]
  before_action :set_order_detail, only: [:edit, :update]

  def index
    @orders = Order.paginate(page: params[:page], per_page: 15)
  end

  def edit
  end

  def show
  end

  def update
    begin
      ActiveRecord::Base.transaction do
        @order_details.destroy_all
        details = []
        params[:details].each do |d|
          details << { quantity: d[:quantity], order_id: @order.id, product_id: d[:product_id] }
        end
        OrderDetail.insert_all!(details)
        redirect_to edit_order_path(@order), notice: '更新完了'
      end
    rescue => e
      debugger
      redirect_to edit_order_path(@order), error: "エラーが発生しました #{e.message}"
    end
  end

  def destroy
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def set_order_detail
      @order_details = OrderDetail
        .includes(:product)
        .references(:product)
        .where("order_id = ?", params[:id])

      @products = Product.includes(:maker)
            .references(:makers)
    end
end
