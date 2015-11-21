class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.date :post_date
      t.integer :point
      t.text :message
      t.references :trip, index: true
      t.timestamps null: false
    end
  end
end
