PlayaPlanner::Application.routes.draw do
	root to: 'list#show'
	resources :users, :only => [:create, :new]
	resource :session, :only => [:create, :destroy, :new]
	resources :items, only: [:index, :create, :update, :destroy]
end
