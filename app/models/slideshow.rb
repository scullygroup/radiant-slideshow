class Slideshow < ActiveRecord::Base
  
  has_many :slides, :order => 'position', :dependent => :destroy
  belongs_to :pages

  attr_accessible :page_id
end