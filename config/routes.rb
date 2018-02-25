Rails.application.routes.draw do
	namespace :api do
		resources :tweets, except: [:new, :edit]
		resources :searches, only: [:index, :create, :destroy]
		# delete '/searches/destroy_all', to 'searches#destroy_all'
		get '/searches/clear', to: 'searches#destroy_all'
		post '/tweets/load_tweets', to: 'tweets#load_tweets'
		post '/headlines/load_headlines', to: 'headlines#load_headlines'
	end
end
