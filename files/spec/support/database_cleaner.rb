RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    #DatabaseCleaner.strategy = :transaction
    DatabaseCleaner[:mongoid].strategy = :truncation
  end

  config.before(:each, :js => true) do
    DatabaseCleaner[:mongoid].strategy = :truncation
    #DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end

