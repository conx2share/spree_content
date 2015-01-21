Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :widgets
  end
end
