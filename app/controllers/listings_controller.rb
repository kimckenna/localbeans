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
    @grinds = Grind.all
    #@listing.grinds.build
    @listing.sizes.build

  end

  def create
    @grinds = Grind.all
    @listing = current_user.stockist.listings.new(listing_params) 
    if @listing.save
      redirect_to listing_path(@listing) 
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
    #params.require(:grind).permit(:bean_grind)
    params.require(:listing).permit(:name, :origin, :flavour_profile, :bean_type, :description, :roast, brand_attributes: [:id, :brand], sizes_attributes: [:id, :size, :price], grind_ids: [])
  end

end
