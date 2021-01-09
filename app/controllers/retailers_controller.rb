class RetailersController < ApplicationController
    def index
        retailers = Retailer.all
        render json: RetailerSerializer.new(retailers)    
    end
      
    def show
      retailer = Retailer.find_by(id: params[:id])
      render json: RetailerSerializer.new(retailer)    
    end
end
