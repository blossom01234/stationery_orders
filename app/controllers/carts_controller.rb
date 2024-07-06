class CartsController < ApplicationController
  def index
    @carts = Cart.where(customer_id: current_customer.id)
  end

  def create
    product_id = params[:product_id]
    cart = Cart.find_or_create_by(customer_id: current_customer.id, product_id: product_id)
    if (cart.quantity.present?)
      cart.quantity += 1
    else
      cart.quantity = 1
    end
    cart.save
    redirect_to carts_path
  end

  def update
    params[:items].each do |id, item_params|
      if item_params[:quantity] == "0"
        Cart.where("customer_id = ?", current_customer.id).find(id).destroy
      else
        Cart.where("customer_id = ?", current_customer.id).find(id).update(quantity: item_params[:quantity])
      end
    end
    redirect_to carts_path, notice: 'カート内容を更新しました'
  end

  def destroy
    Cart.find(params[:id]).destroy
    redirect_to carts_path, notice: '指定した商品をカートから削除しました'
  end
end