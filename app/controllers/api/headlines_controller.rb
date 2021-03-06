#deployed!
class Api::HeadlinesController < ApplicationController
  def index
  end

  def create
  end

  def load_headlines
    begin
      @resp = Faraday.get 'https://newsapi.org/v2/everything' do |req|
          req.headers['X-Api-Key'] = ENV['NEWS_API_KEY']
          req.params['q'] = CGI::escape(params[:search]) #url encode search query
          req.params['language'] = 'en'
          req.params['from'] = (Time.now - 1).utc.to_s.split(" ").first
          req.params['to'] = Time.now.utc.to_s.split(" ").first
          # req.params['sources'] = 'cnn'
          # req.options.timeout = 0
        end
        body = JSON.parse(@resp.body)
        if @resp.success?
          @headlines = body["articles"]
        else
          @error = body["meta"]["errorDetail"]
        end

    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render json: @headlines
  end

end #end class
