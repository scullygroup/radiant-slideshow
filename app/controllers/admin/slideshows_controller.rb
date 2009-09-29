class Admin::SlideshowsController < Admin::ResourceController
  
  def index
    @slideshows = Slideshow.all
    
    respond_to do |format|
      format.html
    end
  end
  
  def show
    @slideshow = Slideshow.find(params[:id])
    @left = @slideshow.slides.find_all_by_bucket("left")
    @middle = @slideshow.slides.find_all_by_bucket("middle")
    @right = @slideshow.slides.find_all_by_bucket("right")
    
    respond_to do |format|
      format.html
    end
  end

  def new
    @slideshow = Slideshow.new
    @slide = Slide.new
    @parent = Page.find_by_url('/')
    @children = @parent.children

    respond_to do |format|
      format.html
    end
  end

  def edit
    @slideshow = Slideshow.find(params[:id])
    @parent = Page.find_by_url('/')
    @children = @parent.children
  end

  def create
    @slideshow = Slideshow.new(params[:slideshow])

    respond_to do |format|
      if @slideshow.save
        flash[:notice] = 'Slideshow was successfully created.'
        format.html { redirect_to('/admin/slideshows') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @slideshow = Slideshow.find(params[:id])

    respond_to do |format|
      if @slideshow.update_attributes(params[:slideshow])
        flash[:notice] = 'Slideshow was successfully updated.'
        format.html { redirect_to('/admin/slideshows') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @slideshow = Slideshow.find(params[:id])
    @slideshow.destroy

    respond_to do |format|
      format.html { redirect_to('/admin/slideshows') }
    end
  end
  
  def update_positions
    @slideshow = Slideshow.find(params[:id])
    @bucket = @slideshow.slides.find(:all, :conditions => ['bucket = ?', params[:bucket]])
    
    @bucket.each do |slide|
      slide.position = params["image-list-#{slide.bucket}"].index(slide.id.to_s) + 1
      slide.save
    end
    render :nothing => true
  end
  
end