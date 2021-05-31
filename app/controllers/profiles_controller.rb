class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:user, :stockist]

  def user
    @user_profile = current_user.id
  end

  def stockist
    #@stockist = Listing.find(params[:id]).stockist_id
    @listing = Listing.includes(:sizes).where(sizes: {active: TRUE})
    @size = Size.all
  end

  def stockist_new
    @stockist = current_user.stockist.new
    @address = Address.new
  end

end
