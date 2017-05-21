require "spec_helper"
require 'site_prism'

describe SitePrism::Tableish::Element do
  let(:root_element) do
    Capybara.visit("file://#{File.expand_path("../../../fixtures/test.html", __FILE__)}")
    Capybara.current_session.find("table#people")
  end
  let(:definition) do
    SitePrism::Tableish::Definition.new do
      column :name
      column :age
    end
  end
  let(:element) { SitePrism::Tableish::Element.new(root_element, definition) }
  describe '#rows' do
    it 'lists the rows inside <tbody>' do
      expect(element.rows.count).to eq 2
    end
    it 'maps the columns according to definition' do
      mapped_rows = element.rows.map{|row| row.map{|k, v| [k, v.text.strip]}.to_h }
      expect(mapped_rows).to include name: 'John', age: '30'
    end
    context "when there is no <thead> nor <tbody>" do
      let(:root_element) do
        Capybara.visit("file://#{File.expand_path("../../../fixtures/test2.html", __FILE__)}")
        Capybara.current_session.find("table#people")
      end
      it 'ignores rows without <td>' do
        expect(element.rows.count).to eq 2
      end
    end
  end
end