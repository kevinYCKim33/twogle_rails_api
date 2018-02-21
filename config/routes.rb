Rails.application.routes.draw do
	namespace :api do
		resources :tweets, except: [:new, :edit]
		post '/tweets/load_tweets', to: 'tweets#load_tweets'
		post '/headlines/load_headlines', to: 'headlines#load_headlines'
	end
end
