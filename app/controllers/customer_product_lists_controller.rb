class CustomerProductListsController < ApplicationController
    before_action :check_customer_sign_in_status
    def index

        @products = Product
            .with_attached_image
            .includes(:maker)
            .paginate(page: params[:page], per_page: 20)
        
        if params[:name].present?
            @products = @products.where("products.name LIKE ?", "%#{params[:name]}")
        end
        
        if params[:maker_id].present?
            @products = @products.where("products.maker_id = ?", params[:maker_id])
        end

        @makers = Maker.all
    end
end
