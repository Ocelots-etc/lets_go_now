class CreatePlaces
  def change
    create_table :place do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longtitude
    end
  end
end
