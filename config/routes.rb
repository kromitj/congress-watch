Rails.application.routes.draw do
	get 'legislators' => 'legislators#index'
	get 'legislators/:action/:id' => 'legislators#find_by'
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end