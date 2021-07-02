# encoding: UTF-8
require 'faraday'

class MovieService
    def fetch_movie_title(movie_id)
    conn = Faraday::Connection.new 'http://localhost:7002/'
    response = conn.get movie_id.to_s
  
    movie_title = response.body
  end 
  
  def fetch_movie_image(movie_id)
    conn = Faraday::Connection.new 'http://localhost:7003/'
    response = conn.get movie_id.to_s
  
    movie_image = response.body
  end 
end