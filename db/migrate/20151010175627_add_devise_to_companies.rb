class AddDeviseToCompanies < ActiveRecord::Migration
  def self.up
    change_table(:companies) do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: "", limit: 40
      t.string :encrypted_password, null: false, default: ""
      t.string :name, limit: 40
      t.string :cnpj, limit: 18
      t.string :phone, limit: 11
      t.string :andress
      t.string :access_token
      t.text :description
      t.float  :note_average

      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

    end

    add_index :companies, :email,                unique: true
    add_index :companies, :reset_password_token, unique: true
    add_index :companies, :name
    add_index :companies, :cnpj
    add_index :companies, :phone
    add_index :companies, :andress
    add_index :companies, :access_token
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
