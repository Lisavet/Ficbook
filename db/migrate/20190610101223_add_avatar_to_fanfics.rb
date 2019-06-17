class AddAvatarToFanfics < ActiveRecord::Migration[6.0]
  def change
    add_column :fanfics, :avatar, :string
  end
end
