class CreateBigGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :big_genres do |t|
      t.string :big_genre

      t.timestamps
    end
  end
end
