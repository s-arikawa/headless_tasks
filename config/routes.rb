Rails.application.routes.draw do
  defaults format: :json do
    resources :tasks do
      member do
        put 'status' => 'tasks#change_status'
      end
    end
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
