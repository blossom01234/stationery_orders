class CustomerProductListsController < ApplicationController
    before_action :check_customer_sign_in_status
    def index
        @products = Product.includes(:maker)
            .with_attached_image
            .references(:makers)
            .paginate(page: params[:page], per_page: 20)
    end
end
