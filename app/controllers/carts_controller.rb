class CartsController < ApplicationController
  def index
    @carts = Cart.where(customer_id: current_customer.id)
  end

  def create
    product_id = params[:product_id]
    cart = Cart.find_by(customer_id: current_customer.id, product_id: product_id)
    if (cart)
      cart.quantity += 1
      cart.save
    end
    redirect_to carts_path
  end

  def update
    redirect_to carts_path
  end

  def destroy
    redirect_to carts_path
  end
end