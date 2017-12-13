Dir.glob(File.absolute_path('../capybara_selectors/**/*.rb', __FILE__)).each { |f| require f }
Dir.glob(File.absolute_path('../sections/**/*.rb', __FILE__)).each { |f| require f }
require 'moj_hwf/calculator/test/page_objects/en/calculator/base_page'
Dir.glob(File.absolute_path('../page_objects/en/**/*.rb', __FILE__)).each { |f| require f }