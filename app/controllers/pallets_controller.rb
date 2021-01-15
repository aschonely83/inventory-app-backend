class PalletsController < ApplicationController
    def index
      pallets = Pallet.all
      render json: PalletSerializer.new(pallets)    
    end
    
    def show
      pallet = Pallet.find_by(id: params[:id])
      options = {
        include: [:retailer]    
      }
      render json: PalletSerializer.new(pallet, options)    
    end

    def create
      pallet = Pallet.create(pallet_params)
      if pallet.save
        render json: PalletSerializer.new(pallet)   
      end        
    end

    private

    def pallet_params
      params.require(:retailer).permit(:boxes, :retailer_id)
    end
end
