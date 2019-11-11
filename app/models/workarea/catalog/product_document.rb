module Workarea
  module Catalog
    class ProductDocument
      include ApplicationDocument
      include Ordering
      extend Dragonfly::Model

      field :type, type: String
      field :document_name, type: String
      field :document_uid, type: String
      field :display_name, type: String

      embedded_in :product,
        class_name: "Workarea::Catalog::Product",
        inverse_of: :product_documents,
        touch: true

      dragonfly_accessor :document, app: :workarea

      def respond_to?(sym, *args)
        super || document.respond_to?(sym)
      end

      def method_missing(sym, *args, &block)
        document.send(sym, *args, &block) if document.respond_to?(sym)
      end
    end
  end
end
