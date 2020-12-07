Rails.application.routes.draw do
  devise_for :users
  resources :notices do
    get :show_pdf
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
