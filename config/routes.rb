Rails.application.routes.draw do
  resources :jobs
  scope module: 'api/v1', path: 'api/v1' do
    resources :employers
    resources :import_configs
  end
  match "/400", to: "errors#bad_request", via: :all
  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all
end
