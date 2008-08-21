class AddCategoryToMember < ActiveRecord::Migration
  def self.up
    add_column :members, :category, :string, :default => 'artist'
  end

  def self.down
    remove_column :members, :category
  end
end
