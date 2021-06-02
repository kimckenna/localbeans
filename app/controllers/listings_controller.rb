class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  
  # Index page: Shows all Listings including sizes, so price can be displayed

  def index
    @listing = Listing.includes(:sizes).where(sizes: {active: TRUE})
    @size = Size.all
    @stockist = Stockist.all
  end

  # New listing page: New listing form with nested attributes allowed for Brand, Grinds and Sizes 

  def new
    @listing = Listing.new
    @brands = Brand.all
    @grinds = Grind.all
    #@listing.grinds.build
    @listing.sizes.build
  end

  # Create New Listing: Creates new listing attached to current user, stockist, uses existing brand and grinds and creates price and size as nested attribute

  def create
    @brands = Brand.all
    @grinds = Grind.all
    @listing = current_user.stockist.listings.new(listing_params) 
    #puts @listing.brand_id
    if @listing.save
      redirect_to listing_path(@listing) 
    else
      #puts @listing.errors.full_messages
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

  # Shows listing slected from index

  def show
    # @listing = Listing.find(params[:id])
  end

  private
 
  def  listing_params
    params.require(:listing).permit(:brand_id, :name, :origin, :flavour_profile, :bean_type, :description, :roast, sizes_attributes: [:id, :size, :price, :active], grind_ids: [])
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

end
