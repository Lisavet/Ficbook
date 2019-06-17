class AddUserIdToFanfics < ActiveRecord::Migration[6.0]
  def change
    add_reference :fanfics, :user
  end
end
