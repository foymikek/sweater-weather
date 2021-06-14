class Api::V1::BooksController < ApplicationController
  def index
    location =  params[:location]
    conn = Faraday.new("http://openlibrary.org") 
    
    response = conn.get("search.json?q=denver co") do |r|
      r.params['location'] = location
    end
    data = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
  end
end