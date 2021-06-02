class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:user, :stockist, :stockist_new, :create, :edit, :update]
  before_action :set_stockist, only: [:stockist, :edit, :update, :destroy]

  # User Profile - allows user to access their profile and can create or (access if already exists) stockist profile or edit account from here

  def user
    @user_profile = current_user.id
  end

  # Stockist profile allows for management of stockist, can access reservations, edit profile and access their stockist brands from here.

  def stockist
    #@stockist = Listing.find(params[:id]).stockist_id
    @listing = Listing.includes(:sizes).where(sizes: {active: TRUE})
    @size = Size.all
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
    # @stockist = current_user.stockist
    # @address = current_user.stockist.addresses.update(stockist_params)
  end

  def update
    if @stockist.update(stockist_params)
      redirect_to profiles_stockist_path(@stockist) 
    else
      render :new
    end
  end

  def create
    #@brands = Brand.all
    @address = Address.all
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
    @stockist_brand = StockistBrand.new
    # @stockist_brands = StockistBrand.all
    # @stockist_brand_new = StockistBrand.new
    @brands = []
    Brand.all.each do |b|
      add = true;
      b.stockists.each do |s|
        add = false if s.id == current_user.stockist.id
        puts s.id
      end
      @brands << b if add
    end
    puts @brands
  
  end

  def stockist_brand_add
    @brand = Brand.find(params[:brand][:brand])
    # stockistbrand = StockistBrand.where(stockist:current_user.stockist, brand:@brand)

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
    # @brands = Brand.all
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