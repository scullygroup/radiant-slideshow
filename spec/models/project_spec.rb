require File.dirname(__FILE__) + '/../spec_helper'

describe Slideshow do
  before(:each) do
    @slideshow = Slideshow.new
  end

  it "should be valid" do
    @slideshow.should be_valid
  end
end
