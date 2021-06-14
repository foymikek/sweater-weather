class Api::V1::BooksController < ApplicationController
  def index
    location =  params[:location]
    conn = Faraday.new("http://openlibrary.org") 
    
    response = conn.get("search.json?q=denver co") do |r|
      r.params['location'] = location
    end
    data = JSON.parse(response.body, symbolize_names: true)
    # require 'pry'; binding.pry
    # total_books_found: data[:num_found]
    #isbn: data[:docs][0][:isbn]
    # title: data[:docs][0][:title]
    # publisher: data[:docs][0][:publisher]
  end
end