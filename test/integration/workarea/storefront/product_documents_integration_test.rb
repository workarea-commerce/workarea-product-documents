require "test_helper"

module Workarea
  module Storefront
    class ProductDocumentIntegrationTest < Workarea::IntegrationTest
      setup :create_document_product

      def create_document_product
        product = create_product
        product.product_documents.build(
          display_name: "document display name",
          document: product_image_file_path
        ).save

        product.save
        @product = product
      end

      def test_document_display
        get storefront.product_path(@product)

        document = @product.product_documents.first
        assert_includes(response.body, document.display_name)
        assert_includes(response.body, document.url)
      end
    end
  end
end
