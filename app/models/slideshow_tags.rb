module SlideshowTags
  include Radiant::Taggable
  
  ###############################################################################################
  #
  # Not sure any of this needs to be used since slideshows_controller.rb now serves the pages
  #
  ###############################################################################################
 
  tag 'slideshows' do |tag|
    tag.expand
  end
          
  tag 'slideshows:each' do |tag|
    result = []
    Slideshow.find(:all, :order => 'title ASC').each do |slideshow|
      tag.locals.slideshow = slideshow
      result << tag.expand
    end
    result
  end
  
  tag 'images' do |tag|
    tag.expand
  end
  
  tag 'images:each' do |tag|
    result = []
      slideshow = tag.locals.slideshow
      slideshow.images.each do |image|
        tag.locals.image = image
        result << tag.expand
      end
    result
  end
  
  tag 'slideshows:each:title' do |tag|
    slideshow = tag.locals.slideshow
    %{#{slideshow.title}}
   end
  
   tag 'slideshows:each:body' do |tag|
     slideshow = tag.locals.slideshow
     %{#{slideshow.body}}
  end

  tag 'images:each:thumb' do |tag|
      image = tag.locals.image
      %{#{image.location_relative_path("thumb")}}
  end
  
  tag 'images:each:medium' do |tag|
      image = tag.locals.image
      %{#{image.location_relative_path("medium")}}
  end
  
  tag 'images:each:image' do |tag|
      image = tag.locals.image
      %{#{image.location_relative_path}}
  end
  
end