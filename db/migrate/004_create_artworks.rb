class CreateArtworks < ActiveRecord::Migration
  def self.up
    create_table :artworks do |t|
      t.string  :content_type, :filename, :thumbnail, :title, :medium,
                :dimensions, :sale
      t.integer :parent_id, :member_id, :size, :width, :height
      t.timestamps
    end
  end

  def self.down
    drop_table :artworks
  end
end
