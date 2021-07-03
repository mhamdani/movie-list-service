# encoding: UTF-8
require 'faraday'

class MovieService
  def fetch_movies(user_id)
    movies = []
    url = 'http://localhost:7001/'
  
    response = Faraday.get(url, users: user_id)
    list = JSON.parse(response.body)
    
    conn = Faraday::Connection.new("http://localhost:7003") do |faraday|
      faraday.adapter :typhoeus
    end
    movie_image_reqs = []
    conn.in_parallel do
      list.each do |id|
        images = conn.get(id.to_s)
        movie_image_reqs << images
      end 
    end
    
    movie_images = movie_image_reqs.map { |req| req.body.force_encoding("UTF-8") }
    
    conn = Faraday::Connection.new("http://localhost:7002") do |faraday|
      faraday.adapter :typhoeus
    end
    movie_title_reqs = []
    conn.in_parallel do
      list.each do |id|
        titles = conn.get(id.to_s)
        movie_title_reqs << titles
      end 
    end
    
    movie_titles = movie_title_reqs.map { |req| req.body.force_encoding("UTF-8") }
      
    list.each_with_index do |movie_id, index| 
      movie_id = movie_id    
      movie = {
        title: movie_titles[index],
        image: movie_images[index],
        movieID: movie_id
      }
      
      movies << movie
    end
    
    movies
  end 
end
