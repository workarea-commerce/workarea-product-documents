Workarea::Admin::Engine.routes.draw do
  resources :catalog_products, only: [] do
    resources :documents, only: [:index, :create, :update, :destroy, :new ], controller: "catalog_product_documents" do
      collection do
        post :move
      end
    end
  end
end
