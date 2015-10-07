class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :origin
      t.string :destination
      t.float :price
      t.string :in_date
      t.string :out_date
      t.string :type
      t.text :description

      t.timestamps null: false
    end
  end
end
