require "test_helper"

module Workarea
  module Admin
    class ProductDocumentIntegrationTest < Workarea::IntegrationTest
      include Admin::IntegrationTest
      setup :create_document_product

      def create_document_product
        @product = create_product
      end

      def test_adding_a_new_document
        post admin.catalog_product_documents_path(@product),
          params: {
            document: {
              display_name: "product document display name",
              document: product_image_file_path
            }
          }

        @product.reload

        assert_equal(1, @product.product_documents.size)

        document = @product.product_documents.first
        assert_equal("product document display name", document.display_name)
      end

      def test_ordering_documents
        @product.product_documents.build(
          display_name: "document 1",
          document: product_image_file_path
        )
        @product.save

        @product.product_documents.build(
          display_name: "document 2",
          document: product_image_file_path
        )
        @product.save

        @product.reload

        document_1 = @product.product_documents.detect { |d| d.display_name == "document 1" }
        document_2 = @product.product_documents.detect { |d| d.display_name == "document 2" }

        position_params = {
          positions: {
            "#{document_2.id.to_s}" => 0,
            "#{document_1.id.to_s}" => 1
          }
        }

        post admin.move_catalog_product_documents_path(@product),
          params: position_params

        @product.reload
        document_1.reload
        document_2.reload

        assert_equal(1, document_1.position)
        assert_equal(0, document_2.position)
      end

      def test_removing_a_document
        @product.product_documents.build(
          display_name: "product document display name",
          document: product_image_file_path
        )

        @product.save
        @product.reload

        document = @product.product_documents.first

        delete admin.catalog_product_document_path(@product, document)

        @product.reload

        assert_equal(0, @product.product_documents.size)
      end
    end
  end
end
