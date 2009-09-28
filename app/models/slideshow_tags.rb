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
  
  tag 'slides' do |tag|
    tag.expand
  end
  
  tag 'slides:each' do |tag|
    result = []
      slideshow = tag.locals.slideshow
      slideshow.slides.each do |slide|
        tag.locals.slide = slide
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

  tag 'slides:each:thumb' do |tag|
      slide = tag.locals.slide
      %{#{slide.location_relative_path("thumb")}}
  end
  
  tag 'slides:each:medium' do |tag|
      slide = tag.locals.slide
      %{#{slide.location_relative_path("medium")}}
  end
  
  tag 'slides:each:slide' do |tag|
      slide = tag.locals.slide
      %{#{slide.location_relative_path}}
  end
  
end