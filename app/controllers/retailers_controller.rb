class RetailersController < ApplicationController
    def index
        @retailers = Retailer.all
        render json: RetailerSerializer.new(@retailers).serializable_hash[:data].map {|hash| hash[:attributes] }    
    end
      
    def show
      @retailer = Retailer.find_by(id: params[:id])
      render json: RetailerSerializer.new(@retailer)   
    end

    def create
      @retailer = Retailer.new(retailer_params)
      
      if @retailer.save
        render json: RetailerSerializer.new(@retailer).serializable_hash[:data][:attributes], status: :created, location: @retailer
      else
        render json: @retailer.errors.full_messages.to_sentence, status: :unprocessable_entity  
      end
    end

    private

    def set_retailer
      @retailer = Retailer.find(params[:id])
    end

    def retailer_params
      params.require(:retailer).permit(:name)
    end
end
