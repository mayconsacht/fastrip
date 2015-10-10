class AddDeviseToUsers < ActiveRecord::Migration
  def self.up
    change_table(:users) do |t|

      t.string :name
      t.string :email
      t.string :cpf
      t.string :phone
      t.string :andress
      t.string :password
      t.string :access_token
      t.string :photo_url
      
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    add_index :users, :name
    add_index :users, :cpf
    add_index :users, :phone
    add_index :users, :andress
    add_index :users, :access_token
    add_index :users, :photo_url
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
