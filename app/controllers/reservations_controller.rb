class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: [:reservation, :destroy]

  def index
  
    @listings = current_user.stockist.listings.includes(:sizes).ids
    #@sizes = Size.where('sizes.listing_id = ?', @listings)
    @sizes = Size.where(listing_id: @listings)

    r = Reservation.pluck(:size_id)
    reserve = Reservation.all

    @reservations = []

    #Loop to get all reservations that belong to a size that belongs to a listing that belongs to current_user stockist and doesn't include the current_user id

    if @listings.present?
      @sizes.each do |s|
        if r.include?(s.id)
          reserve.each do |res|
            if res.size_id == s.id && res.user_id != current_user.id
              @reservations << res
            end
          end
        end
      end
    end 
  end

  def show
    @reservation = current_user.reservations.last
    @size = Size.find(@reservation.size_id)
    @grind = Grind.find(@reservation.grind_id)
    @listing = Listing.includes(:stockist).find(@size.listing_id)
  end

  def reservation
    @size = Size.find(@reservation.size_id)
    @grind = Grind.find(@reservation.grind_id)
    @listing = Listing.includes(:stockist).find(@size.listing_id)
  end

  def create
    puts reservation_params
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.save
      redirect_to show_reservation_path
    else
      puts @reservation.errors.full_messages
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
