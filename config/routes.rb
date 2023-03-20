Rails.application.routes.draw do
  devise_for :users, :controllers => {
		:confirmations => "users/confirmations",
		:registrations => "users/registrations",
		:sessions => "users/sessions",
		:passwords => "users/passwords",
	}

	devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

	root "top#index"
	get "users/account"
	get "users/profile", to: 'users#profile', as: :users_profile
	resources :users

  get "area_search" => "searches#area_search"
	get "keyword_search" => "searches#keyword_search"


  resources :rooms
	get "/reservations/index" => "reservations#index"
	post "/reservations/confirm" => "reservations#confirm"
	post "/reservations/create" => "reservations#create"
	get "/reservations/:id" => "reservations#show", as: :reservations
	get "/reservations/:id/edit" => "reservations#edit", as: :reservations_edit
	patch "/reservations/:id/edit_confirm" => "reservations#edit_confirm", as: :reservations_edit_confirm
	patch "/reservations/:id" => "reservations#update"
  put "/reservations/:id" => "reservations#update"

end

