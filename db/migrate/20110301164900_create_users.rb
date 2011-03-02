class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.boolean :active, :default => true
      t.string :first
      t.string :last
      t.string :email
      t.string :ip_address
      t.string :persistence_token
      t.string :perishable_token

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
