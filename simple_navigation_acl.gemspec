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
  spec.summary     = "Great and easy way to control ACL with simple-navigation"
  spec.description = "Great and easy way to control ACL with simple-navigation in your Rails project"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  # spec.test_files = Dir["spec/**/*"]

  spec.add_dependency 'haml'

end
