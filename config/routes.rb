ActionController::Routing::Routes.draw do |map|
  map.connect '/slideshows', :controller => "slideshows", :action => "index"
  map.connect '/slideshow/:slug', :controller => "slideshows", :action => "show"
  map.connect '/slide/:id', :controller => "slideshows", :action => "slide"

  map.resources :slideshows

  map.namespace(:admin, :controller => 'slideshows') do |admin|
    admin.slideshow_index           'slideshows',                       :action => 'index'
    admin.slideshow_new             'slideshows/new',                   :action => 'new'   
    admin.slideshow_create          'slideshows/create',                :action => 'create'
    admin.slideshow_show            'slideshows/:id',                   :action => 'show'   
    admin.slideshow_edit            'slideshows/:id/edit',              :action => 'edit'
    admin.slideshow_update          'slideshows/:id/update',            :action => 'update'
    admin.slideshow_updatepos       'slideshows/:id/update_positions',  :action => 'update_positions'
    admin.slideshow_remove          'slideshows/:id/remove',            :action => 'destroy'
  end

  map.namespace(:admin, :controller => 'slides') do |admin|
    admin.slide_index           'slides',             :action => 'index'
    admin.slide_new             'slides/new',         :action => 'new'
    admin.slide_create          'slides/create',      :action => 'create'
    admin.slide_show            'slides/:id',         :action => 'show'   
    admin.slide_edit            'slides/:id/edit',    :action => 'edit'
    admin.slide_update          'slides/:id/update',  :action => 'update'  
    admin.slide_remove          'slides/:id/remove',  :action => 'destroy'
  end
end