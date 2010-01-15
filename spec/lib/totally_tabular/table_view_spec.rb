require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')

describe TotallyTabular::TableView do

  before do
    @table_view = TotallyTabular::TableView.new
  end

  it "is initialized" do
    @table_view.should_not be_nil
  end
end
