PlayaPlanner::Application.routes.draw do
  root to: 'list#show'
  resource :list, only: ['show', 'update']
  resource :items, only: ['create', 'update', 'destroy']
end
