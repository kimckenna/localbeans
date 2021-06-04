class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
  end

  # def new
  # end

  def create
    # @size = Size.listing.find(params[:id])
    # @listing = Size.find(params[:listing_id])
    @reservation = current_user.reservations.create(reservation_params)
    if @reservation.save
      redirect_to show_reservation_path
    else
      puts @reservation.errors.full_messages
      render :index
      #redirect_to request.referrer
    end
  end

  private 

  def  reservation_params
    params.require(:reservation).permit( :sizes_ids, :grinds_ids )
  end
end
