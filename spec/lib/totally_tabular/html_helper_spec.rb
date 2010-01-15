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
end
