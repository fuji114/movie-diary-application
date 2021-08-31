class Movie < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre, :movie_age
  belongs_to :user

  validates :genre_id, numericality: { other_than: 1 , message: "can't be blank"} 

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
end
