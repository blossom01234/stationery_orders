class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :destroy]

  def index
    @customers = Customer.paginate(page: params[:page])
  end

  def create
    @customer = Customer.new(customer_params)
  end

  def edit

  end

  def destroy

  end

  def update
    
  end

  private
    def customer_params
      params.require(:customer).permit(
        :first_name, :last_name,
        :first_name_kana, :last_name_kana,
        :organization, :email)
    end
end