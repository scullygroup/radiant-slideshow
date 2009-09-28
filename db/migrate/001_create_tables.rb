class CreateTables < ActiveRecord::Migration
  def self.up
    create_table :slides do |t|
      t.integer   :slideshow_id
      t.string    :bucket
      t.integer   :position
      t.integer   :parent_id
      t.string    :slide_file_name
      t.string    :slide_content_type
      t.integer   :slide_file_size
      t.datetime  :slide_updated_at

      t.timestamps
    end
    
    create_table :slideshows do |t|
      t.integer :page_id

      t.timestamps
    end
  end

  def self.down
    drop_table :slides
    drop_table :slideshows
  end
end