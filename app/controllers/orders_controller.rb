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
        params[:details].each_with_index  do |d, index|
          # テンプレート用の行はスキップ
          next if index == 0
          # 1件でも必須項目が無い場合はエラーメッセージ表示
          if d[:quantity].blank? or d[:product_id].blank?
            redirect_to edit_order_path(@order), alert: '商品または数量が入っていません'
            raise ActiveRecord::Rollback
            return
          end
          details << { quantity: d[:quantity], order_id: @order.id, product_id: d[:product_id] }
        end
        OrderDetail.insert_all!(details)
        redirect_to edit_order_path(@order), notice: '更新完了'
      end
    rescue => e
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
