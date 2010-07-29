# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SlideshowsExtension < Radiant::Extension
  version "2.0"
  description "A Radiant extension that allows you to create and manage slideshows on multiple pages"
  url "http://www.scullytown.com"
  
  def activate
    tab 'Slideshows' do
      add_item "Slideshows", "/admin/slideshows"
    end
    Page.send :include, SlideshowsTags
    NoCachePage
  end
  
  def deactivate
    # admin.tabs.remove "Slideshow"
  end
  
end