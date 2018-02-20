class Api::TweetsController < ApplicationController
  def index
  end

  def create
  end

  def load_tweets
    search = params[:search]
    begin
      @resp = Faraday.get 'https://api.twitter.com/1.1/search/tweets.json' do |req|
          req.params['q'] = search
          req.params['result_type'] = 'mixed' #mixed, recent, popular
          req.params['count'] = 30 #doesn't work with popular
          req.params['tweet_mode'] = 'extended'
          req.headers['Content-Type'] = 'application/json'
          req.headers['Authorization'] = "Bearer " + ENV['BEARER_TOKEN']
          # req.options.timeout = 0
        end
        body = JSON.parse(@resp.body)
        if @resp.success?
          @tweets = body["statuses"]
        else
          @error = body["meta"]["errorDetail"]
        end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render json: @tweets
  end
end #end class
