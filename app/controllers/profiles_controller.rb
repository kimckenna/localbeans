class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:user, :stockist, :stockist_new, :create]

  def user
    @user_profile = current_user.id
  end

  def stockist
    #@stockist = Listing.find(params[:id]).stockist_id
    @listing = Listing.includes(:sizes).where(sizes: {active: TRUE})
    @size = Size.all
  end

  def new
    #@brands = Brand.all
    @stockist = current_user.build_stockist
    @address = Address.new
    @stockist.addresses.build
  end

  def edit
    @stockist = current_user.stockist.edit
    @address = current_user.stockist.address.edit
  end

  def create
    #@brands = Brand.all
    @stockist = current_user.build_stockist(stockist_params)
    # @stockist = Stockist.create(stockist_params)
    #@user_profile.stockist = @stockist
    @address = Address.new
    # @stockist = current_user.create_stockist(stockist_params)
    if @stockist.save
      redirect_to profiles_stockist_path(@stockist) 
    else
      render :new 
    end
  end

  def brand
    @brands = Brand.all
    @stockist_brands = StockistBrand.all
    @stockist_brand_new = StockistBrand.new
    # @search = params["search"]
    # if @search.present?
    #   @brand = @search["brand"]
    #   @brands = Brand.where("brand ILIKE ?", "%#{@brand}%")
    # end
  end

  def brand_new
    @brands = Brand.new
    @brand.stockist_brands.build
  end

  def brand_create
    @brands = Brand.all
    @brand = Brand.new(brand_params)
    current_user.stockist.stockist_brands.create(brand:@brand)
    if @brand.save
      redirect_to profiles_stockist_brand_path(@stockist) 
    
    else
      render :brand_new 
    end
  end

  private
 
  def  stockist_params
    params.require(:stockist).permit(:business_name, :abn, address_attributes: [:id, :address_line1, :address_line2, :suburb, :state, :postcode], brand_ids: [])
  end

  def  brand_params
    params.require(:brand).permit(:brand)
  end
end