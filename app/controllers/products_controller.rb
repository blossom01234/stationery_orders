class ProductsController < ApplicationController
    before_action :set_product, only: [:edit, :update, :destroy]
    before_action :set_makers, only: [:index, :edit, :new]
    
    def index
        filters = []
        values = []

        # 以下のようなwhereの指定になる
        # ["products.name LIKE ?", "%test%"]
        if params[:name].present?
            filters << 'products.name LIKE ?'
            values << "%#{params[:name]}%"
        end

        if params[:maker_id].present?
            filters << 'products.maker_id = ?'
            values << params[:maker_id]
        end

        if params[:product_code].present?
            filters << 'products.product_code = ?'
            values << params[:product_code]
        end

        if filters.present?
            @products = Product.includes(:maker)
            .references(:makers)
            .where(filters.join(' AND '), *values)
            .paginate(page: params[:page], per_page: 15)
        else
            @products = Product.includes(:maker)
            .references(:makers)
            .paginate(page: params[:page], per_page: 15)
        end
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
            set_makers
            render :new, status: :unprocessable_entity
        end
    end

    def update
        if @product.update(product_params)
            redirect_to :products, notice: 'Product was successfully updated.'
        else
            set_makers
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @product.destroy
        redirect_to :products, notice: 'Product was successfully destroyed.'
    end

    private
        def set_makers
            @makers = Maker.all.map { |maker| [maker.name, maker.id] }
            @makers.unshift(['選択してください', nil]) if @makers.any?
        end

        def set_product
            @product = Product.find(params[:id])
        end

        def product_params
            params.require(:product).permit(:maker_id, :jancode, :name, :product_code, :price, :unit, :note, :image)
        end
end
