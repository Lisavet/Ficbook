class AddAncestryToGenres < ActiveRecord::Migration[6.0]
  def change
    add_column :genres, :ancestry, :string
    add_index :genres, :ancestry
  end
end
