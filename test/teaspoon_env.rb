require "workarea/testing/teaspoon"

Teaspoon.configure do |config|
  config.root = Workarea::ProductDocuments::Engine.root
  Workarea::Teaspoon.apply(config)
end
