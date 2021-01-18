class RetailersController < ApplicationController
  before_action :set_retailer, only: [:show, :destroy]
  
    def index
        @retailers = Retailer.all
        render json: @retailers, except: [:created_at, :updated_at]   
    end
      
    def show
      render json: @retailers, except: [:created_at, :updated_at]
    end

    def create
      retailer = Retailer.new(retailer_params)
      render json: retailer, status: 200
    end

    def destroy
      @retailer.destroy
    end

    private

    def set_retailer
      @retailer = Retailer.find(params[:id])
    end

    def retailer_params
      params.require(:retailer).permit(:name)
    end
end
