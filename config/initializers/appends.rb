module Workarea
  Plugin.append_partials(
    "storefront.product_show",
    "workarea/storefront/products/product_documents"
  )

  Plugin.append_partials(
    "admin.catalog_product_cards",
    "workarea/admin/catalog_products/documents_card"
  )

  Plugin.append_javascripts(
    "admin.modules",
    "workarea/admin/modules/sort_documents"
  )

  Plugin.append_stylesheets(
    "store_front.components",
    "workarea/storefront/product_documents/components/product_documents"
  )
end
