class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table  :members do |t|
      t.integer   :number
      t.string    :username, :email, :pass_hash, :pass_salt,
                  :firstname, :surname, :role, :medium, :permalink,
                  :address, :state, :pcode, :phone
      t.text      :profile
      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
