class Movie < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :movie_age

  belongs_to :user
  has_one :comment
  has_one :cast
  has_one_attached :image

  

end
