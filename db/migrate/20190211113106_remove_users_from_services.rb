class RemoveUsersFromServices < ActiveRecord::Migration[5.0]
  def change
    remove_reference :services, :users, foreign_key: true
  end
end
