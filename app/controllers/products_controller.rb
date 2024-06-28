class ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :update, :destroy]
    
    def index
        @products = Product.includes(:maker).references(:makers).paginate(page: params[:page], per_page: 15)
    end

    def new
        @product = Product.new
    end

    def edit
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            redirect_to :products, notice: 'Product was successfully created.'
        else
            render :new
        end
    end

    def update
        if @product.update(product_params)
            redirect_to :products, notice: 'Product was successfully updated.'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @product.destroy
        redirect_to :products, notice: 'Product was successfully destroyed.'
    end

    private
        def set_product
            @product = Product.find(params[:id])
        end

        def product_params
            params.require(:product).permit(:maker_id, :jancode, :name, :product_code, :price, :unit, :note)
        end
end
