class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :cpf
      t.string :phone
      t.string :andress
      t.string :password
      t.string :access_token
      t.string :uid
      t.string :photo_url
      t.string :provider

      t.timestamps null: false
    end
  end
end
