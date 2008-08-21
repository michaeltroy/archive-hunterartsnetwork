class CreateViewings < ActiveRecord::Migration
  def self.up
    create_table :viewings do |t|
      t.column :viewable_type,  :string
      t.column :viewable_id,    :integer
      t.column :views,          :integer,   :default => 0
      t.column :created_at,     :datetime, :null => false
      t.column :updated_at,     :datetime
    end
  end

  def self.down
    drop_table :viewings
  end
end