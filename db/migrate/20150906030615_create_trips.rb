class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :category
      t.string :name
      t.string :origin
      t.string :destination
      t.float :price
      t.string :in_date
      t.string :out_date
      t.text :description
      t.references :company, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
  end
end
