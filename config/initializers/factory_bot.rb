unless Rails.env.production?
	require 'rspec/rails'

	RSpec.configure do |config|
	  config.include FactoryBot::Syntax::Methods
	end
end
