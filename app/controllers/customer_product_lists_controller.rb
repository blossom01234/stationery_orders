class CustomerProductListsController < ApplicationController
    before_action :check_customer_sign_in_status
    def index
        @products = Product
            .with_attached_image
            .includes(:maker)
            .paginate(page: params[:page], per_page: 20)
    end
end
