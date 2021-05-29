class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @listing = Listing.includes(:sizes).where(sizes: {active: TRUE})
    @size = Size.all
    @stockist = Stockist.all
  end

  # @listing_sizes = Size.find_by_listing_id(@listing.id)
  # @active = @listing_sizes.includes(:sizes).where(sizes: {active: TRUE})



  #User.includes(:posts).where(posts: { title: 'Bobby Table' })

  def new
    @listing = Listing.new
    @brand = Brand.new
    @size = Size.new
    @grind = Grind.new
    @listing.build_brand
    # @listing.build_sizes
    # @listing.build_grinds
  end

  def create
    @listing = current_user.stockist.listings.new(listing_params)
    if @listing.save
      redirect_to @listing 
    else
      render :new 
    end
  end

  def edit
  end

  def show
    @listing = Listing.find(params[:id])
  end

  private
 
  def  listing_params
    params.require(:listing).permit(:name, :origin, :flavour_profile, :bean_type, :description, :roast, brand_attributes: [:brand],grind_attributes: [:bean_grind], size_attributes: [:size, :price])
  end
end
