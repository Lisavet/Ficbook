class CreateChapters < ActiveRecord::Migration[6.0]
  def change
    create_table :chapters do |t|
      t.belongs_to :fanfic, index: true
      t.integer :index
      t.string :title
      t.text :body
      # t.belongs_to :fanfic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
