PlayaPlanner::Application.routes.draw do
	root to: 'list#show'
	resources :users, :only => [:create]
	resource :session, :only => [:create, :destroy, :new]
	resources :items, only: [:index, :create, :update, :destroy]
end
