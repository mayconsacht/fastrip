class AddAttachmentAvatarToTrips < ActiveRecord::Migration
  def self.up
    change_table :trips do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :trips, :avatar
  end
end
