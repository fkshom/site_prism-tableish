# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'site_prism/tableish/version'

Gem::Specification.new do |spec|
  spec.name          = "site_prism-tableish"
  spec.version       = SitePrism::Tableish::VERSION
  spec.authors       = ["Shoma FUKUDA"]
  spec.email         = ["fkshom@gmail.com"]

  spec.summary       = %q{Table scraping for SitePrism}
  spec.description   = %q{Table scraping for SitePrism}
  spec.homepage      = "https://github.com/fkshom/site_prism-tableish"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
