class CreateEventBlends < ActiveRecord::Migration
  def self.up
    create_table :event_blends do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :event_blends
  end
end
