PlayaPlanner::Application.routes.draw do
  root to: 'list#show'
  resources :items, only: ['index', 'create', 'update', 'destroy']
end
