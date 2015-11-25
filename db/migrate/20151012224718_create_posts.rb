class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string  :name, limit: 40
      t.integer :note, limit:2
      t.text :opinion_local
      t.text :opinion_best
      t.text :opinion_worst
      t.references :trip, index: true
      t.timestamps null: false
    end
  end
end
