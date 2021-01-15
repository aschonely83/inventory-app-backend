class RetailersController < ApplicationController
    def index
        retailers = Retailer.all
        render json: RetailerSerializer.new(retailers)    
    end
      
    def show
      retailer = Retailer.find_by(id: params[:id])
      render json: RetailerSerializer.new(retailer)    
    end

    def create
      retailer = Retailer.create(retailer_params)
      if retailer.save
        render json: RetailerSerializer.new(retailer)
      end
    end

    private

    def retailer_params
      params.permit(:name)
    end
end
