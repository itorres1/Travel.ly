Travelly::Application.routes.draw do
  root 'welcome#index'

  resources :trips do
    resources :stops, only: [:new, :create, :show, :index], shallow: true do
      resources :entries, shallow: true
    end
  end

  resources :places, only: [:show]
end