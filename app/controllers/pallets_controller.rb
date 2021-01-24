class PalletsController < ApplicationController
  before_action :set_pallet, only: [:show, :update, :destroy]

    def index
      @pallets = Pallet.all
      
      render json: @pallets, except: [:created_at, :updated_at]   
    end

    def create
      @pallet = Pallet.new(pallet_params)
           
      if @pallet.save
        render json: @pallet, status: :created, location: @pallet
      else
        render json: @pallet.errors, status: :unprocessable_entity  
      end
    end

    private

    def set_pallet
      @pallet = Pallet.find(params[:id])
    end

    def pallet_params
      params.require(:pallet).permit(:boxes, :retailer_id)
    end
end
