class HomeController < ApplicationController
  def index
    redirect_to products_path unless signed_in?
  end
end
