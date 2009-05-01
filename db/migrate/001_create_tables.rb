class CreateTables < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.integer :slideshow_id
      t.string  :bucket
      t.integer :position
      t.integer :parent_id
      t.string  :content_type
      t.string  :filename
      t.string  :thumbnail
      t.integer :size
      t.integer :width
      t.integer :height
      t.integer :order
      

      t.timestamps
    end
    
    create_table :slideshows do |t|
      t.integer :page_id

      t.timestamps
    end
  end

  def self.down
    drop_table :images
    drop_table :slideshows
  end
end