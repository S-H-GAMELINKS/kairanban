Rails.application.routes.draw do
  get '/mypage', to: 'users#mypage'
  get '/mypage', to: 'users#edit'
  resources :examples
  root 'web#index'
  get '/about', to: 'web#about'
  get '/contact', to: 'web#contact'
  devise_for :users
  resources :notices do
    get :show_pdf
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
