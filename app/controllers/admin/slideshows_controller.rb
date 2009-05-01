class Admin::SlideshowsController < Admin::ResourceController
 #model_class Slideshow
  
  def index
    @slideshows = Slideshow.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slideshows }
    end
  end
  
  def show
    @slideshow = Slideshow.find(params[:id])
    @image = Image.new(params[:image])
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slideshow }
    end
  end

  def new
    @slideshow = Slideshow.new
    @image = Image.new
    @parent = Page.find_by_url('/')
    @children = @parent.children

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @slideshow }
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
        format.xml  { render :xml => @slideshow, :status => :created, :location => @slideshow }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @slideshow.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    #params[:slideshow][:tag_ids] ||= []
    @slideshow = Slideshow.find(params[:id])

    respond_to do |format|
      if @slideshow.update_attributes(params[:slideshow])
        flash[:notice] = 'Slideshow was successfully updated.'
        format.html { redirect_to('/admin/slideshows') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @slideshow.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @slideshow = Slideshow.find(params[:id])
    @slideshow.destroy

    respond_to do |format|
      format.html { redirect_to('/admin/slideshows') }
      format.xml  { head :ok }
    end
  end
  
  def update_positions
    @slideshow = Slideshow.find(params[:id])
    @bucket = @slideshow.images.find(:all, :conditions => ['bucket = ?', params[:bucket]])
    
    @bucket.each do |image|
      image.position = params["image-list-#{image.bucket}"].index(image.id.to_s) + 1
      image.save
    end
    render :nothing => true
  end
  
end