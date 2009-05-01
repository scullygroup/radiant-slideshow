# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class SlideshowsExtension < Radiant::Extension
  version "1.0"
  description "A Radiant extension that allows you to create and manage slideshows on multiple pages"
  url "http://www.scullytown.com"
  
  define_routes do |map|
    
    #This links to an xml file listing of all the slideshows, defined in the extension tags
    #map.connect 'slideshows', :url => '/slideshows', :controller => "site", :action => "show_page"
    map.connect 'slideshows', :controller => "slideshows", :action => "index"
    map.connect 'slideshow/:slug', :controller => "slideshows", :action => "show"
    map.connect 'image/:id', :controller => "slideshows", :action => "image"
    
    map.resources :slideshows
    
    map.with_options(:controller => 'admin/slideshows') do |slideshow|
      slideshow.slideshow_index           'admin/slideshows',             :action => 'index'
      slideshow.slideshow_show            'admin/slideshows/show/:id',    :action => 'show'   
      slideshow.slideshow_new             'admin/slideshows/new',         :action => 'new'
      slideshow.slideshow_create          'admin/slideshows/create',      :action => 'create'   
      slideshow.slideshow_edit            'admin/slideshows/edit/:id',    :action => 'edit'
      slideshow.slideshow_update          'admin/slideshows/update/:id',  :action => 'update'
      slideshow.slideshow_updatepos       'admin/slideshows/update_positions/:id',  :action => 'update_positions'
      slideshow.slideshow_remove          'admin/slideshows/remove/:id',  :action => 'destroy'
    end
    
    map.with_options(:controller => 'admin/images') do |image|
      image.image_index           'admin/images',             :action => 'index'
      image.image_show            'admin/images/show/:id',    :action => 'show'   
      image.image_new             'admin/images/new',         :action => 'new'
      image.image_create          'admin/images/create',      :action => 'create'
      image.image_edit            'admin/images/edit/:id',    :action => 'edit'
      image.image_update          'admin/images/update/:id',  :action => 'update'  
      image.image_remove          'admin/images/remove/:id',  :action => 'destroy'
    end
  end
  
  def activate
    admin.tabs.add "Slideshows", "/admin/slideshows", :after => "Layouts", :visibility => [:all]
    Page.send :include, SlideshowTags
    NoCachePage
  end
  
  def deactivate
    # admin.tabs.remove "Slideshow"
  end
  
end