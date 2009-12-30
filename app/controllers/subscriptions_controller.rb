class SubscriptionsController < Clearance::UsersController
  before_filter :get_product
  
  def new
    @user = User.new
  end

  def create
    @user = User.new params[:user]
    if @user.create_and_subscribe(@product.id)      
      ::ClearanceMailer.deliver_confirmation @user
      flash_notice_after_create
      redirect_to(url_after_create)
    else
      render :action => :new
    end        
  end

  private
    def get_product
      @product = Chargify::Product.find(params[:product_id])    
    end
    
end
