class Api::SearchesController < ApplicationController
  def index
    # binding.pry
    render json: Search.all.order(updated_at: 'DESC')
  end

  def create
    search = Search.find_or_create_by(keywords: params["search"], search_url: CGI::escape(params[:search]))
    render json: search
  end

  def destroy_all
    Search.destroy_all
  end

end
