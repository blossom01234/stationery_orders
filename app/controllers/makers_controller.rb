class MakersController < ApplicationController
    before_action :set_maker, only: [:edit, :update, :destroy]

    def index
        @makers = Maker.paginate(page: params[:page], per_page: 15)
    end

    def new
        @maker = Maker.new
    end

    def create
        @maker = Maker.new(maker_params)
        if @maker.save
            redirect_to :makers, notice: 'Maker was successfully created.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @maker.update(maker_params)
            redirect_to :makers, notice: 'Maker was successfully updated.'
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @maker.destroy
        redirect_to :makers, notice: 'Maker was successfully destroyed.'
    end

    private
        def set_maker
            @maker = Maker.find(params[:id])
        end

        def maker_params
            params.require(:maker).permit(:name)
        end
end
