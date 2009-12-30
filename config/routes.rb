ActionController::Routing::Routes.draw do |map|

  map.resources :products, :only => [:index] do |products|
    products.resources :subscriptions, :only => [:new, :create]
  end

  map.root :controller => "home"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
