class AddGenreIdToFanfics < ActiveRecord::Migration[6.0]
  def change
    add_column :fanfics, :genre_id, :integer
    add_index :fanfics, :genre_id
  end
end
