class User < ActiveRecord::Base
  include Clearance::User
  extend ActiveSupport::Memoizable
  
  validates_presence_of :first_name, :last_name
  
  validates_presence_of [:expiration_month, :expiration_year, :credit_card_number, :cvv], :on => :create
                        
  attr_accessible :first_name, :last_name,
                  :expiration_month, :expiration_year, 
                  :credit_card_number, :cvv, :customer_id,
                  :subscription_id
  
  attr_accessor :expiration_month, :expiration_year, 
                :credit_card_number, :cvv

  
  def create_and_subscribe(product_id)
    return unless self.valid?
    User.transaction do
      self.save
      subscription = Chargify::Subscription.new(subscription_params(product_id))
      if subscription.save
        self.update_attributes!(:customer_id => subscription.customer.id, :subscription_id => subscription.id)
      else
        subscription.errors.full_messages.each{|err| errors.add_to_base(err)}
        false
        raise ActiveRecord::Rollback 
      end
    end
  end
  
  def subscription
    Chargify::Subscription.find(subscription_id)
  end
  
  def customer
    Chargify::Customer.find(customer_id)
  end
  
  memoize :subscription, :customer
  
  private
    def customer_params
      {
        :first_name   => first_name,
        :last_name    => last_name,
        :email        => email,
        :reference    => id,
        :organization => "",      
      }
    end
  
    def subscription_params(product_id)
      {
        :product_id => product_id,
        :customer_attributes => customer_params,
        :credit_card_attributes => {
          :full_number => credit_card_number,        
          :cvv => cvv,
          :expiration_month => expiration_month,
          :expiration_year => expiration_year
        }      
      }
    end  
end
