Rails.application.routes.draw do
	namespace :api do
		resources :tweets, except: [:new, :edit]
		resources :searches, only: [:index, :create, :delete ]
		# post '/searches', to: 'searches#create'
		post '/tweets/load_tweets', to: 'tweets#load_tweets'
		post '/headlines/load_headlines', to: 'headlines#load_headlines'
	end
end
