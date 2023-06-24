Rails.application.routes.draw do
  root to: 'pages#home'
  get 'fact_cats', to: 'fact_cats#index', as: 'fact_cats'
  get 'fact_cats_favorite', to: 'fact_cats#favorite', as: 'fact_cats_favorite'
  post 'fact_cats/:fact_cat_id/increment_click_count', to: 'fact_cats#increment_click_count', as: 'fact_cats_count_click'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
end
