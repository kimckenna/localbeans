class ListingsController < ApplicationController
  before_action :autheticate_user!, only: [:new, :edit]

  def index
    @listing = Listing.all
  end

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
