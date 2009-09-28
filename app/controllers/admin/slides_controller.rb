class Admin::SlidesController < ApplicationController
  
  def index
    @slides = Slide.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @slide = Slide.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @slide = Slide.new
    
    respond_to do |format|
      format.html
    end
  end

  def edit
    @slide = Slide.find(params[:id])
  end
  
  def create
    @slide = Slide.new(params[:slide])
    
    respond_to do |format|
      if @slide.save
        flash[:notice] = 'Slide was successfully created.'
        format.html { redirect_to :back }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @slide = Slide.find(params[:id])

    respond_to do |format|
      if @slide.update_attributes(params[:slide])
        flash[:notice] = 'Slide was successfully updated.'
        format.html { redirect_to(@slide) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @slide = Slide.find(params[:id])
    @slide.destroy

    respond_to do |format|
      format.html { redirect_to :back }
    end
  end
  
end
