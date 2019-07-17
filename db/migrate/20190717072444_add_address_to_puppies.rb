class AddAddressToPuppies < ActiveRecord::Migration[5.2]
  def change
    add_column :puppies, :address, :string
  end
end
