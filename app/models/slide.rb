class Slide < ActiveRecord::Base

  belongs_to :slideshow
  
  has_attached_file :slide,
                    :url => "/slideshows/:id/:style/:basename.:extension",
                    :styles => { :normal => '420x168>', :thumb => '100x100>', :left => '420x168>', :middle => '366x168>', :right => '216x168>' }
  
  validates_attachment_presence     :slide
  validates_attachment_content_type :slide, :content_type => ['image/jpeg', 'image/gif', 'image/png']
  
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