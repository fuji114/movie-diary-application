class MovieCast
  include ActiveModel::Model
  attr_accessor :movie_title, :image, :movie_age_id, :genre_id, :film_director, :movie_rating, :synopsis, :user_id, :actor,:start_time


  with_options presence: true do
    validates :movie_title, :image, :movie_age_id, :genre_id
  end

  validate :film_director, :synopsis
  validates :genre_id, :movie_age_id, numericality: { other_than: 1, message: "can't be blank" }, allow_blank: true

  validates :movie_rating, numericality: {
    less_than_or_equal_to: 5, greater_than_or_equal_to: 1}

  def save
    movie = Movie.create(
      movie_title: movie_title,image: image,movie_age_id: movie_age_id,
      genre_id: genre_id, film_director: film_director,movie_rating: movie_rating,
      start_time: start_time, synopsis: synopsis, user_id: user_id)
    Cast.create(actor: actor, movie_id: movie.id)
  end
  
  def self.search(search)
    if search != ""
      Movie.where('movie_title LIKE(?)', "%#{search}%")
    else
      Movie.all
    end
  end
end