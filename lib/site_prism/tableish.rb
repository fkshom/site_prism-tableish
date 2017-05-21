require "site_prism/tableish/version"

module SitePrism
  module Tableish

    autoload :Element,    'site_prism/tableish/element'
    autoload :Definition, 'site_prism/tableish/definition'

    def table(table_name, *args, &block)
      definition = Definition.new(&block)
      define_method table_name do |*runtime_args, &element_block|
        Element.new(page.find(*args), definition)
      end
    end
  end
end
