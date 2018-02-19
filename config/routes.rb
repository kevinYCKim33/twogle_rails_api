Rails.application.routes.draw do
	Namespace :api do
		Resources :tweets, except: [:new, :edit]
	end
End
