class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: [:reservation, :destroy]

  def index
    # @reservations = []
    # @stockist = current_user.stockist.id
    # @sizes = Size.pluck(:id)where(:listing_id == @stockist)
    # #@listing = Listing.find(@size.listing_id)
  end

  def show
    @reservation = current_user.reservations.last
    @size = Size.find(@reservation.size_id)
    @grind = Grind.find(@reservation.grind_id)
    @listing = Listing.find(@size.listing_id)
  end

  def reservation
    @size = Size.find(@reservation.size_id)
    @grind = Grind.find(@reservation.grind_id)
    @listing = Listing.find(@size.listing_id)
  end

  def create
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
