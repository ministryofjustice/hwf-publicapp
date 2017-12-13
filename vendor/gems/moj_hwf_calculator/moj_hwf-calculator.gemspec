$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "moj_hwf/calculator/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "moj_hwf-calculator"
  s.version     = MojHwf::Calculator::VERSION
  s.authors     = ["Gary Taylor"]
  s.email       = ["gary.taylor@hmcts.net"]
  s.homepage    = "http://www.google.com"
  s.summary     = "Ministry of justice help with fees calculator - public app engine"
  s.description = "Ministry of justice help with fees calculator - public app engine"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.7.1"
  s.add_dependency "virtus", "~> 1.0"
  s.add_dependency "slim-rails", "~> 3.1"
  s.add_dependency "rest-client", "~> 2.0"

end
