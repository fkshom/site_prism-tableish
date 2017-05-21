module SitePrism
  module Tableish
    class Element
      include Capybara::DSL
      def initialize(root_element, definition)
        @root_element = root_element
        @definition = definition
      end

      def rows
        [].tap do |result|
          Capybara.within(@root_element){
            all(:xpath, ".//tbody/tr | .//body/tr").each do |row_in|
              row_out = {}
              row_in.all(:xpath, "td").each_with_index do |cell, i|
                name, options = @definition.columns[i]
                row_out[name] = cell
              end
              result << row_out unless row_out.empty?
            end
          }
        end
      end
    end
  end
end
