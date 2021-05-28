class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:user, :stockist]

  def user
  end

  def stockist
  end

end
