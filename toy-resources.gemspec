$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "toy-resources/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "toy-resources"
  s.version     = ToyResources::VERSION
  s.authors     = ["Christian Mortaro"]
  s.email       = ["christian.mortaro@gmail.com"]
  s.homepage    = "https://github.com/Mortaro/Toy-Resources"
  s.summary     = "Handles the resources for Toy-Locomotive"
  s.description = "Allows to declare resources and routes in a single line"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_development_dependency "rails"
  s.add_development_dependency "toy-attributes"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "shoulda"
  s.add_development_dependency "sqlite3"
end
