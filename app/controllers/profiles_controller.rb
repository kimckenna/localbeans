class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:user, :stockist, :stockist_new, :create, :edit, :update]
  before_action :set_stockist, only: [:stockist, :edit, :update, :destroy]

  # User Profile - allows user to access their profile and can create or (access if already exists) stockist profile or edit account from here

  def user
    @user_profile = current_user.id
    @reservations = current_user.reservations.all
  end

  # Stockist profile allows for management of stockist, can access reservations, edit profile and access their stockist brands from here.

  def stockist
    #@stockist = Listing.find(params[:id]).stockist_id
    @listing = current_user.stockist.listings.includes(:sizes).with_attached_images
    @size = Size.all
    @address = current_user.stockist.addresses.first
  end

  # New creates a new stockist as each user can only ahve one stockist account and the user account management is already handled by devise

  def new
    #@brands = Brand.all
    @stockist = current_user.build_stockist
    #@address = Address.new
    @stockist.addresses.build
  end

  # Edit related to editing a stockist details - 

  def edit
    @address = Address.all
  end

  def update
    if @stockist.update(stockist_params)
      redirect_to profiles_stockist_path(@stockist) 
    else
      render :new
    end
  end

  def create
    @address = Address.all
    @stockist = current_user.build_stockist(stockist_params)
    @address = Address.new
    
    if @stockist.save
      redirect_to profiles_stockist_path(@stockist) 
    else
      render :new 
    end
  end

  def brand
    @stockist_brand = StockistBrand.new

    brand_ids = current_user.stockist.stockist_brands.pluck(:brand_id)
    @brands = Brand.where.not(id: brand_ids)

  
  end

  def stockist_brand_add
    @brand = Brand.find(params[:brand][:brand])

    current_user.stockist.stockist_brands.create(brand:@brand)
    if @brand.save
      redirect_to profiles_stockist_brand_path(@stockist) 
    else
      render :brand 
    end
  end

  def brand_new
    @brand = Brand.new
    @brand.stockist_brands.build
  end

  def brand_create
  
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
    params.require(:stockist).permit(:business_name, :abn, addresses_attributes: [:id, :address_line1, :address_line2, :suburb, :state, :postcode], brand_ids: [])
  end

  def  brand_params
    params.require(:brand).permit(:id, :brand)
  end

  def set_stockist
    @stockist = current_user.stockist
  end
end