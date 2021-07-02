# encoding: UTF-8
require 'faraday'

class MovieService
  def fetch_movies(user_id)
    movies = []
    url = 'http://localhost:7001/'
  
    response = Faraday.get(url, users: user_id)
    list = JSON.parse(response.body)  
    list.each do |movie_id|
      title = fetch_movie_title(movie_id).force_encoding("UTF-8")
      image = fetch_movie_image(movie_id).force_encoding("UTF-8")
      movie_id = movie_id
    
      movie = {
        title: title,
        image: image,
        movieID: movie_id,
      }
      movies << movie
    end
    movies
  end 
  
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