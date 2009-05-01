class SlideshowsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, :with => :route_not_found
  
  no_login_required
  #radiant_layout 'Slideshow'
  
  def index
    @slideshows = Image.find(:all)
    render :layout => false
  end
  
  def show
    @page = Page.find_by_slug(params[:slug])
    @slideshow = Slideshow.find_by_page_id(@page.id)
    
    @left = @slideshow.images.find_by_left
    @middle = @slideshow.images.find_by_middle
    @right = @slideshow.images.find_by_right
    
    respond_to do |format|
      format.xml  { render :xml => @slideshows }
    end
  end
  
  def image
    @slideshow = Slideshow.find(params[:id])
    render :layout => false
  end

  private
  
  def route_not_found
    render :text => '', :status => :not_found
    #redirect_to '/'
  end
  
end
