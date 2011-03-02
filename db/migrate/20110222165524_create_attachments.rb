class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.string :title
      
      t.string :phile_file_name
      t.string :phile_content_type
      t.integer :phile_file_size
      t.datetime :phile_updated_at
      
      t.integer :note_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
