class CreateFanfics < ActiveRecord::Migration[6.0]
  def change
    create_table :fanfics do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
