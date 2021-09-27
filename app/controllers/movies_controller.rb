class MoviesController < ApplicationController
  before_action :movie_to_index, except: [:index]

  def index
    @movies = Movie.includes(:user).order('created_at DESC')
  end

  def new
    @movie_cast = MovieCast.new
  end
#binding.pry
  def create
    @movie_cast = MovieCast.new(movie_params)
    if @movie_cast.valid?
      @movie_cast.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end
  
  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to movie_path(@movie.id)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to root_path
  end

  def search
    @movies = MovieCast.search(params[:keyword])
    @keyword = params[:keyword]
    render "search"
  end


  private

  def movie_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def movie_params
    params.require(:movie_cast).permit(:image, :movie_title, :genre_id, :movie_age_id,:film_director, :synopsis, :movie_rating, :actor,:start_time).merge(user_id: current_user.id)
  end
end