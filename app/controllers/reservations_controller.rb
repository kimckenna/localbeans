class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reservation, only: [:reservation, :destroy]

  def index
    # @reservations = []
    # @stockist = current_user.stockist.id
    # @sizes = Size.pluck(:id)where(:listing_id == @stockist)
    # #@listing = Listing.find(@size.listing_id)

    @listings = current_user.stockist.listings.includes(:sizes).ids

    puts "current_user"
    puts @current_user
    
    puts "Listings" 
    puts @listings

    @sizes = Size.where(listing_id: @listings)

    puts "Sizes" 
    puts @sizes
    r = Reservation.pluck(:size_id)

    puts r
    @reservations = []

    if @listings.present?
      @sizes.each do |s|
        puts " #{s} I am s"
        if r.include?(s.id)
          puts " #{s.id} exist"
          puts " #{current_user.id} current user id"
          @reservations = Reservation.where(:size_id == s.id && :user_id != current_user.id)
          
          puts " #{@reservations} is now "
        end
      end
    end  
    #@reservations = Reservation.pluck(:size_id == @sizes)

    puts "Reservations" 
    puts @reservations




     # @reservations = []
    # @stockist = current_user.stockist.id
    # @sizes = Size.pluck(:id)where(:listing_id == @stockist)
    # #@listing = Listing.find(@size.listing_id)

    @listings = current_user.stockist.listings.includes(:sizes).ids

    puts "current_user"
    puts @current_user
    
    puts "Listings" 
    puts @listings

    @sizes = Size.where(listing_id: @listings)

    puts "Sizes" 
    puts @sizes
    r = Reservation.pluck(:size_id)

    @reserve = Reservation.all

    puts r
    @reservations = []

    if @listings.present?
      @sizes.each do |s|
        puts " #{s} I am s"
        if r.include?(s.id)
          puts " #{s.id} exist"
          puts " #{current_user.id} current user id"
          @reserve.each do |res|
            if res.size_id == s.id && res.user_id != current_user.id
              puts "IN LOOP"
              puts " #{s.id} s (size) "
              puts " #{res.size_id} res.size_id "
              puts " #{res.user_id} res.user_id "
              puts " #{current_user.id} current_user.id"
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
