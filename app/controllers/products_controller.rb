class ProductsController < ApplicationController
  
  def index
    @products = Chargify::Product.find(:all)    
  end

end
