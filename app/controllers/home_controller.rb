class HomeController < ApplicationController
  def index
    # if params[:search].present?
    #   @parameter = params[:search]
    #   @listing = Listing.all
    #   @listing.each do |l|
    #     l.stockist.addresses.first.where("suburb LIKE :query", search: @parameter)
    #   #@search = Listing.stockist.addresses.first.search_by_suburb(params[:query])
    #   end
    # else
    #   @search = Listing.all
    # end
  end

end