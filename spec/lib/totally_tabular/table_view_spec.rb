require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')

require 'ostruct'
require 'nokogiri'

include TotallyTabular

describe TableView do

  def selector(string, selector)
    Nokogiri(string).css(selector)
  end

  before do
    @table_view = TableView.new([]) do |table|
      table.column("col") do |o|
      end
    end
  end

  it "should be instantiated" do
    @table_view.should_not be_nil
  end

  it "should take a collection when initialized" do
    lambda { TableView.new }.should raise_error(ArgumentError)
  end

  it "should take a hash of options" do
    lambda { TableView.new(mock, {}) }.should_not raise_error
  end

  it "should render an empty table" do
    @table_view.render.should == "<table><thead></thead><tbody></tbody><tfoot></tfoot></table>"
  end

  it "should render with a class" do
    table_class = "CLASS"

    t = TableView.new([], :class => table_class) do |table|
      table.column("col") do |o|
      end
    end

    selector(t.render, "table.#{table_class}").should_not be_empty
  end

  it "should render with cellpadding, cellspacing" do
    t = TableView.new([], :cellpadding => 0, :cellspacing => 0) do |table|
      table.column("col") do |o|
      end
    end

    selector(t.render, "table[cellpadding='0']").should_not be_empty
    selector(t.render, "table[cellspacing='0']").should_not be_empty
  end

  context "displaying multiple objects in rows" do

    before do
      o = OpenStruct.new(:name => "Joe", :coolness => "Really cool!", :age => 28)
      o2 = OpenStruct.new(:name => "Jonathan", :coolness => "Kinda cool.", :age => 33)
      o3 = OpenStruct.new(:name => "Gary", :coolness => "Eh.", :age => 26)
      o4 = OpenStruct.new(:name => "Josh", :coolness => "Lame.", :age => 26)
      @table_view = TableView.new([o, o2, o3, o4]) do |t|
        t.column("Name") do |column|
          column.template! do |o, row|
            "%s is %s" % [o.name, o.coolness]
          end
        end
        t.column("Age") do |column|
          column.template! do |o, row|
            o.age
          end
        end
      end
      @result = @table_view.render
    end

    it "should display 4 rows" do
      selector(@result, "table tbody tr").length.should == 4
    end

    it "should have 2 column headers" do
      selector(@result, "table thead th").length.should == 2
    end

    it "should have 2 columns" do
      selector(@result, "table tr:first-child td").length.should == 2
    end
  end

  context "defining columns" do

    before do
      t = TableView.new([1]) do |table|
        table.column("Blah") do |column|
          @column_object = column
          column.template! do |o, row|
            @row_object = row
          end
        end
      end
      t.render
    end

    it "allows defining class on header" do
      t = TableView.new([1]) do |table|
        table.column("Blah", :class => "blahdiddy") do |column|
          column.template! do |o, row|
          end
        end
      end

      selector(t.render, "table th.blahdiddy").length.should == 1
    end

    it "yields a column object" do
      @column_object.should_not be_nil
    end

    it "should allow template definition" do
      lambda{ @column_object.template! }.should_not raise_error
    end

    it "yields a row object" do
      @row_object.should_not be_nil
    end

    it "allows defining attributes on a row" do
      lambda{ @row_object.attributes! }.should_not raise_error
    end

    it "allows defining a class on a row" do
      @row_object.attributes!(:class => "yourmom")
      selector(@row_object.render("aaa"), "tr.yourmom").should_not be_empty
    end

    it "should take a block and give a table class" do
      table = TableView::Table.new
      TableView::Table.stub!(:new).and_return(table)

      column_definition = Proc.new { |table| }
      table_view = TableView.new([], {}, &column_definition)

      column_definition.should_receive(:call).with(table)

      table_view.render
    end

    it "should allow me to define a column" do
      column_definition = Proc.new do |table|
        table.column("Joe") do |column|
          column.template! do
          end
        end
      end

      t = TableView.new([], {}, &column_definition)
      lambda { t.render }.should_not raise_error
    end

    it "should allow defining the column body when defining the column" do
      t = TableView.new(["Judge"]) do |table|
        table.column("Name") do |column|
          column.template! do |item, row|
            "My name is %s." % item
          end
        end
      end

      selector(t.render, "table tr td").inner_html.should == "My name is Judge."
    end

  end
end
