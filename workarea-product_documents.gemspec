$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "workarea/product_documents/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "workarea-product_documents"
  s.version     = Workarea::ProductDocuments::VERSION
  s.authors     = ["Jeff Yucis"]
  s.email       = ["jyucis@weblinc.com"]
  s.homepage    = "https://github.com/workarea-commerce/workarea-product-documents"
  s.summary     = "workarea product documents plugin"
  s.description = "Add documents to a product which are displayed on the detail page for downloading"
  s.files       = `git ls-files`.split("\n")

  s.add_dependency "workarea", "~> 3.x"
end
