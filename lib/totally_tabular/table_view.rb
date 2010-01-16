require File.dirname(__FILE__) + '/table'
require File.dirname(__FILE__) + '/column'
require File.dirname(__FILE__) + '/row'
require File.dirname(__FILE__) + '/html_helper'

module TotallyTabular
  class TableView

    def initialize(collection, options={}, &block)
      @collection = collection
      @options = options
      @column_definition = block
      @helper = HtmlHelper.new
    end

    def render
      table = Table.new
      table.instance_eval(&@column_definition)
      headers = if @collection.empty?
                  ""
                else
                  build_headers(table.columns)
                end
      rows = build_rows(@collection, table.columns)
      tbody = @helper.content_tag(:tbody, rows.join)
      thead = @helper.content_tag(:thead, headers)
      tfoot = @helper.content_tag(:tfoot)
      @helper.content_tag(:table, [thead, tbody, tfoot], options)
    end

    def options
      @options
    end

    private

    def build_rows(collection, columns)
      collection.map do |item|
        row = Row.new
        row.render(columns.map do |column|
          @helper.content_tag(:td, column.template.call(item, row))
        end.join)
      end
    end

    def build_headers(columns)
      headers = columns.map do |column|
        @helper.content_tag(:th, column.name, column.header_attributes)
      end
      Row.new.render(headers)
    end

  end
end
