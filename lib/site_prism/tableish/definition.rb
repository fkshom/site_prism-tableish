module SitePrism
  module Tableish
    class Definition
      attr_reader :columns
      def initialize(&block)
        @columns = []
        instance_exec(&block)
      end

      def column(name, options={})
        @columns << [ name, options ]
      end
    end
  end
end
