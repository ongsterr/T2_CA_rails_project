class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :location
      t.string :country
      t.string :continent

      t.timestamps
    end
  end
end
