class Movie < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :movie_age

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :movie_title, :image, :movie_age, :genre
  end

  validates :film_director, :synopsis
  validates :genre_id, :movie_age_id, numericality: { other_than: 1 , message: "can't be blank"} 

  validates :movie_rating, numericality: {
    less_than_or_equal_to: 5, greater_than_or_equal_to: 1
  }, presence: true
end
