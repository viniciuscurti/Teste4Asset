class AddressesController < ApplicationController
  skip_verify_authenticity_token
  
  def index
    @addresses = Address.all
  end

  def show
    @address = Address.find(params[:id])
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      render json: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      render json: @address
    else
      render json: @address.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    render json: 'Address was successfully destroyed.'
  end
  
  private
  def address_params
    params.require(:address).permit(:street, :number, :city, :state, :country, :person_id)
  end
end
