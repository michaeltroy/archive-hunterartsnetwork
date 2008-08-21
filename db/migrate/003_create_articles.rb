class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.string  :title, :subtitle, :permalink, :category
      t.text    :copy
      t.integer :member_id
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
