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
    redirect_to carts_path
  end

  def destroy
    redirect_to carts_path
  end
end