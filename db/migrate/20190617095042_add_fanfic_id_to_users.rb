class AddFanficIdToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :fanfic
  end
end
