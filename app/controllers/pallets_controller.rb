class PalletsController < ApplicationController
    def index
      @pallets = Pallet.all
      
      render json: @pallets, except: [:created_at, :updated_at]   
    end

    def create
      pallet = Pallet.new(pallet_params)
      
      render json: pallet, status: 200
    end

    private

    def pallet_params
      params.require(:retailer).permit(:boxes, :retailer_id)
    end
end
