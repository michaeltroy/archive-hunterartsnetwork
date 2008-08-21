class AddPublicToMember < ActiveRecord::Migration
  def self.up
    add_column :members, :public, :boolean, :default => 0
  end

  def self.down
    remove_column :members, :public
  end
end
