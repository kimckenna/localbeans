class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :set_stockist_listing, only: [:edit, :update, :destroy] 
  
  # Index page: Shows all Listings including sizes, so price can be displayed


  def home_create
    
  end

  def index
    @listing = Listing.includes(:sizes).where(sizes: {active: TRUE}).with_attached_images
    @size = Size.all
    @stockist = Stockist.all
  end

  # New listing page: New listing form with nested attributes allowed for Brand, Grinds and Sizes 

  def new
    @listing = Listing.new
    @brands = Brand.all
    @grinds = Grind.all
    @listing.sizes.build
  end

  # Create New Listing: Creates new listing attached to current user, stockist, uses existing brand and grinds and creates price and size as nested attribute

  def create
    @brands = Brand.all
    @grinds = Grind.all
    @listing = current_user.stockist.listings.new(listing_params) 
    if @listing.save
      redirect_to listing_path(@listing) 
    else
      render :new 
    end
  end

  def update
    @brands = Brand.all
    @grinds = Grind.all
    if @listing.update(listing_params)
      redirect_to @listing 
    else
      render :edit
    end
  end

  def edit
    @brands = Brand.all
    @grinds = Grind.all
  end

  def sizes_new
    @size = Size.new
  end

  def sizes_create
    @listing = Listing.find(params[:id])
    @size = @listing.sizes.new(size_params)
    if @size.save
      redirect_to edit_listing_path
    else
      render :sizes_new 
    end
  end

  def show
    @sizes = @listing.sizes.where(active: TRUE)   
    @grinds = @listing.grinds.all
    if current_user.present?
      @reservation = current_user.reservations.new
    else
      redirect_to new_user_session_path  
    end
  end

  def destroy

  end

  private

  def show_listing_params
    
  end
 
  def  listing_params
    params.require(:listing).permit(:brand_id, :name, :origin, :flavour_profile, :bean_type, :description, :roast, :images, sizes_attributes: [:id, :size, :price, :active], grind_ids: [])
  end

  def  size_params
    params.require(:sizes).permit(:id, :size, :price, :active, :listing_id)
  end


  def set_listing
    @listing = Listing.find(params[:id])
  end

  # Redirects to listing if user attempts to edit and isn't stockist who created/owns listing
  def set_stockist_listing
    @listing = current_user.stockist.listings.find_by_id(params[:id])
    if @listing == nil
      redirect_to Listing.find(params[:id])
    end
  end

end
