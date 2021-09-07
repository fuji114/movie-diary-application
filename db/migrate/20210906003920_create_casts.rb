class CreateCasts < ActiveRecord::Migration[6.0]
  def change
    create_table :casts do |t|
      t.string :actor
      t.references :movie,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
