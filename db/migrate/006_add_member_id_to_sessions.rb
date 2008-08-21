class AddMemberIdToSessions < ActiveRecord::Migration
  def self.up
    add_column :sessions, :member_id, :integer
  end

  def self.down
    remove_column :sessions, :member_id
  end
end
