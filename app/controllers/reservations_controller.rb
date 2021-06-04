class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: [:destroy]

  def index
  end

  def show
    @new_reservation = current_user.reservations.last
    @size = Size.find(@new_reservation.size_id)
    @grind = Grind.find(@new_reservation.grind_id)
    @listing = Listing.find(@size.listing_id)
  end

  # def new
  # end

  def create
    # @size = Size.listing.find(params[:id])
    # @listing = Size.find(params[:listing_id])
    puts reservation_params
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.save
      redirect_to show_reservation_path
    else
      puts @reservation.errors.full_messages
      #render :index
      redirect_to request.referrer
    end
  end

  private 

  def  reservation_params
    params.require(:reservations).permit(:grind_id, :size_id)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
