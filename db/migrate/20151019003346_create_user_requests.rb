class CreateUserRequests < ActiveRecord::Migration
  def change
    create_table :user_requests do |t|
      t.string :user_name
      t.string :user_phone
      t.string :user_email
      t.string :status
      t.text   :user_message
      t.references :trip, index: true
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end