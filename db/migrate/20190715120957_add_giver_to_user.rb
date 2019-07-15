class AddGiverToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :giver, :boolean, default: false
  end
end
