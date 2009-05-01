class Slideshow < ActiveRecord::Base
  
  has_many :images, :order => 'position', :dependent => :destroy
  belongs_to :pages

end