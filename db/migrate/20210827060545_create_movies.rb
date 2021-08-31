class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :movie_title,           null: false
      t.integer :movie_age_id,           null: false
      t.integer :film_director
      t.integer :genre_id,           null: false
      t.text :synopsis
      t.float :movie_rating,           null: false
      t.text :review
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
