# SitePrism::Tableish

SitePrism::Tableish extends [SitePrism](https://github.com/natritmeyer/site_prism)
making it easer and faster to parse `<table>` elements.

Inspied by [SitePrism::Table](https://github.com/investtools/site_prism-table)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'site_prism-tableish'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install site_prism-tableish

## Usage

Example:

```ruby
require 'site_prism'
require 'capybara/dsl'
require 'site_prism/tableish'
require 'selenium-webdriver'
require 'pp'

Capybara.default_driver = :selenium

class W3SchoolsTablesPage < SitePrism::Page
  extend SitePrism::Tableish
  set_url 'http://www.w3schools.com/html/html_tables.asp'
  table :customers, '#customers' do
    column :company
    column :contact
    column :country
  end
end

page = W3SchoolsTablesPage.new
page.load
pp page.customers.rows

# [{:company=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[2]/td[1]">,
#   :contact=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[2]/td[2]">,
#   :country=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[2]/td[3]">},
#  {:company=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[3]/td[1]">,
#   :contact=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[3]/td[2]">,
#   :country=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[3]/td[3]">},
#  {:company=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[4]/td[1]">,
#   :contact=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[4]/td[2]">,
#   :country=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[4]/td[3]">},
#  {:company=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[5]/td[1]">,
#   :contact=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[5]/td[2]">,
#   :country=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[5]/td[3]">},
#  {:company=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[6]/td[1]">,
#   :contact=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[6]/td[2]">,
#   :country=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[6]/td[3]">},
#  {:company=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[7]/td[1]">,
#   :contact=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[7]/td[2]">,
#   :country=>
#    #<Capybara::Node::Element tag="td" path="/html/body/div[6]/div[1]/div[1]/div[3]/div/table/tbody/tr[7]/td[3]">}]

pp page.customers.rows.map{|row| row.map{|k, v| [k, v.text.strip]}.to_h }

# [{:company=>"Alfreds Futterkiste",
#   :contact=>"MARIA ANDERS",
#   :country=>"Germany"},
#  {:company=>"Centro comercial Moctezuma",
#   :contact=>"FRANCISCO CHANG",
#   :country=>"Mexico"},
#  {:company=>"Ernst Handel", :contact=>"ROLAND MENDEL", :country=>"Austria"},
#  {:company=>"Island Trading", :contact=>"HELEN BENNETT", :country=>"UK"},
#  {:company=>"Laughing Bacchus Winecellars",
#   :contact=>"YOSHI TANNAMURI",
#   :country=>"Canada"},
#  {:company=>"Magazzini Alimentari Riuniti",
#   :contact=>"GIOVANNI ROVELLI",
#   :country=>"Italy"}]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fkshom/site_prism-tableish. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
