class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string    :category, :title, :subtitle, :permalink, 
                  :location, :link, :artist
      t.datetime  :opendate, :closedate, :starttime
      t.text      :copy
      t.integer   :member_id
      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
