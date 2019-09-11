Rails.application.routes.draw do
  scope module: 'api/v1', path: 'api/v1' do
    resources :employers
    resources :import_configs
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
