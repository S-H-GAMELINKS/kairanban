Rails.application.routes.draw do
  get 'web/index'
  get 'web/about'
  get 'web/contact'
  devise_for :users
  resources :notices do
    get :show_pdf
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
