class MoviesController <ApplicationController
  def index 
  end 
  
  def search
    if params[:user_id].present?
      @movie = MovieService.new.fetch_movies(params[:user_id]) 
      if @movie
        render json: { status: 200, message: @movie }
      else 
        render json: {status: 400, message: "Failed"}
      end 
    end
  end
end 
