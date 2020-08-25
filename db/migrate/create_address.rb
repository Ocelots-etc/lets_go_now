class CreateAddress
  def change
    create_table :addresses do |t|
     t.string :address
     t.float :lat
     t.float :long
   end
  end
end
