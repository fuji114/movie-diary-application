class MoviesController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @movies = Movie.includes(:user).order('created_at DESC')
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def movie_params
    params.require(:movie)
    .permit(
      :image, :movie_title, :genre_id, :movie_age_id, 
      :film_director, :synopsis, :movie_rating
    )
    .merge(user_id: current_user.id)
  end
end
