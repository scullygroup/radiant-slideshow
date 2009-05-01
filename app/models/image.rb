class Image < ActiveRecord::Base

  belongs_to :slideshow
  
  has_attachment :content_type => :image, 
                   :storage => :file_system,
                   :path_prefix => 'public/slideshows', 
                   :max_size => 500.kilobytes,
                   :resize_to => '420x168>',
                   :thumbnails => { :thumb => '100x100>', :left => '420x168>', :middle => '366x168>', :right => '216x168>' }

  validates_as_attachment
  
  def self.find_by_left
    find(:all, :order => "position", :conditions => ['bucket = ?', 'left'])
  end
  
  def self.find_by_middle
    find(:all, :order => "position", :conditions => ['bucket = ?', 'middle'])
  end
  
  def self.find_by_right
    find(:all, :order => "position", :conditions => ['bucket = ?', 'right'])
  end
  
end