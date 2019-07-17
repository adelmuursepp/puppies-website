class AddCoordiantesToPuppies < ActiveRecord::Migration[5.2]
  def change
    add_column :puppies, :latitude, :float
    add_column :puppies, :longitude, :float
  end
end
