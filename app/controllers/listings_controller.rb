class ListingsController < ApplicationController
  before_action :autheticate_user!, only: [:new, :edit]

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
  end

  def create
    @listing = current_user.listings.create()
  end

  def edit
  end

  def show
    @listing = Listing.find(params[:id])
  end
end
