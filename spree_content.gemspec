# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_content'
  s.version     = '0.0.1'
  s.summary     = 'Spree Widgets'
  s.description = 'Spree Widgets'
  s.required_ruby_version = '>= 1.9.3'

  s.author    = 'Ivgeni Slabkovski'
  s.email     = 'ivgeni@conx2share.com'
  s.homepage  = 'http://www.conx2share.com'

  s.files       = `git ls-files`.split("\n")
  s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 3.0.0'
  s.add_dependency 'virtus', '~> 1.0.2'
  s.add_dependency 'inflecto', '~> 0.0.2'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 4.0.2'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'shoulda-matchers', '~> 2.5'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'sqlite3'
end
