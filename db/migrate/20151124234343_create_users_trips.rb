class CreateUsersTrips < ActiveRecord::Migration
  def change
    create_table :users_trips do |t|
    	t.integer :user_id
        t.integer :trip_id
    end
  end
end
