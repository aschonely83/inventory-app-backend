class PalletsController < ApplicationController
  before_action :set_pallet, only: [:show, :update, :destroy]

    def index
      @pallets = Pallet.all
      
      render json: @pallets    
    end
    
    def show
     render json: @pallets
    end

    def create
      @pallet = Pallet.new(pallet_params)
      
      if @pallet.save
        render json: PalletSerializer.new(@pallet).serializable_hash[:data][:attributes], status: :created, location: @pallet
      else
        render json: @pallet.errors.full_messages.to_sentence, status: :unprocessable_entity     
      end        
    end

    def update
      if @pallet.update(pallet_params)
        render json: @pallet
      else 
        render json: @pallet.errors, status: :unprocessable_entity   
      end
    end

    def destroy
      @pallet.destroy
    end

    private

    def set_pallet
      @pallet = Pallet.find(params[:id])
    end

    def pallet_params
      params.require(:retailer).permit(:boxes, :retailer_id)
    end
end
