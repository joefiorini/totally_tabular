require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')
require 'totally_tabular/html_helper'

include TotallyTabular

describe HtmlHelper do

  before do
    @helper = HtmlHelper.new
  end

  it "is instantiated" do
    @helper.should_not be_nil
  end

  it "returns an empty table tag" do
    @helper.tag(:table).should == "<table></table>"
  end

  it "returns an empty br tag" do
    @helper.tag(:br).should == "<br>"
  end

  it "returns an empty input tag" do
    @helper.tag(:input).should == "<input>"
  end

  it "returns an empty img tag" do
    @helper.tag(:img).should == "<img>"
  end

  it "returns a tag with content" do
    @helper.tag(:strong, "blah").should == "<strong>blah</strong>"
  end

  it "renders with a class specified" do
    @helper.tag(:strong, "blah", :class => "diddy").should =~ /class=\"diddy\"/
  end

  it "renders with a href attribute specified" do
    url = "http://www.google.com"
    @helper.tag(:a, "blah", :href => url).should =~ /href=\"#{url}\"/
  end

  it "renders empty tags with attributes" do
    src = "http://www.asite.com/images/my_image.jpg"
    @helper.tag(:img, "", :src => src).should =~ /src=\"#{src}\"/
  end
end
