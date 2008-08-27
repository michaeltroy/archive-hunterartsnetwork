class CreateUpdateMailers < ActiveRecord::Migration
  def self.up
    create_table :update_mailers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :update_mailers
  end
end
