$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "msf/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "msf"
  s.version     = Msf::VERSION
  s.authors     = ["Chendan"]
  s.email       = ["chend@cnns.net"]
  s.homepage    = "https://github.com/chendan66610cool/FirstApp"
  s.summary     = "Summary of Msf."
  s.description = "escription of Msf."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"

  s.add_development_dependency "sqlite3"
end
