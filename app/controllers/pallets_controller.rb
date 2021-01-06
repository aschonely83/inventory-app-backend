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
end
