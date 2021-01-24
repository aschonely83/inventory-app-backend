class RetailersController < ApplicationController
  before_action :set_retailer, only: [:show, :update, :destroy]
  
    def index
        @retailers = Retailer.all
        render json: RetailerSerializer.new(@retailers).serializable_hash[:data].map {|hash| hash[:attributes] }    
    end
      
    def show
      render json: { 
        id: params[:id], 
        palletsAttributes: RetailerPalletSerializer.new(@retailer, include: [:pallets]).serializable_hash[:included].map {|hash| hash[:attributes]}
      }     
    end

    def create
      @retailer = Retailer.new(retailer_params)
      
      if @retailer.save
        render json: @retailer, status: :created, location: @retailer
      else
        render json: @retailer.errors, status: :unprocessable_entity  
      end
    end

    def destroy
      @retailer.destroy
      render json: {id: @retailer.id}, status: :ok
    end

    private

    def set_retailer
      @retailer = Retailer.find(params[:id])
    end

    def retailer_params
      params.require(:retailer).permit(:name)
    end
end
