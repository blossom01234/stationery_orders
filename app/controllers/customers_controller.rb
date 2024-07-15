class CustomersController < ApplicationController
  before_action :set_customer, only: [:edit, :update, :destroy]

  def index
    @customers = Customer.paginate(page: params[:page])
  end

  def create
    @customer = Customer.new(customer_params)
  end

  def new
    @customer = Customer.new
  end

  def edit
  end

  def destroy
    @customer.destory
    redirect_to :customers, notice: 'Customer was successfully deleted.'
  end

  def update
    if @customer.update(customer_params)
      redirect_to :customers, notice: 'Customer was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(
        :first_name, :last_name,
        :first_name_kana, :last_name_kana,
        :organization, :email)
    end
end