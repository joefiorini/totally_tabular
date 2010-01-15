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

  it "returns empty string" do
    @helper.tag("").should be_empty
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

  it "returns a tag with content" do
    @helper.tag(:strong, "blah").should == "<strong>blah</strong>"
  end
end
