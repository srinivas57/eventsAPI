Rails.application.routes.draw do
  resources :events, :defaults => { :format => :json }
  resources :repos, :defaults => { :format => :json }, only: %[show]   do
    resources :events, only: %[index]
  end  
end
