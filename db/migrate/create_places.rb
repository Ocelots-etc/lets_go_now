class CreatePlaces < ActiveRecord::Migration[5.1]
  def change
    create_table :place do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longtitude

      t.timestamps
    end
  end
end 
