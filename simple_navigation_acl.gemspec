$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_navigation_acl/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "simple-navigation-acl"
  spec.version     = SimpleNavigationAcl::VERSION
  spec.authors     = ["Bruno Porto"]
  spec.email       = ["brunotporto@gmail.com"]
  spec.homepage    = "https://github.com/brunoporto/simple_navigation_acl"
  spec.summary     = "Feature to control ACL over simple-navigation."
  spec.description = "Feature to control ACL over simple-navigation."
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  # spec.test_files = Dir["spec/**/*"]

  spec.add_dependency 'haml'

  # spec.add_dependency 'rails', ['>= 3', '< 5']
  # spec.add_runtime_dependency 'spreadsheet'
  # spec.add_runtime_dependency 'to_xls'

  # spec.add_development_dependency 'rspec'

end
