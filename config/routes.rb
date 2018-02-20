Rails.application.routes.draw do
	namespace :api do
		resources :tweets, except: [:new, :edit]
		post '/tweets/load_tweets', to: 'tweets#load_tweets'
	end
end
