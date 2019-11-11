module Workarea
  class Admin::CatalogProductDocumentsController < Admin::ApplicationController
    required_permissions :catalog
    before_action :find_product

    def index; end

    def create
      @document = @product.product_documents.build(params[:document])

      if @document.save
        flash[:success] = t("workarea.admin.product_documents.flash_messages.create")
        redirect_to catalog_product_documents_path(@product)
      else
        render :index, status: :unprocessable_entity
      end
    end

    def update
      document = @product.product_documents.find(params[:id])

      if document.update_attributes(params[:document])
        flash[:success] = t("workarea.admin.product_documents.flash_messages.update")
        redirect_to catalog_product_documents_path(@product)
      else
        render :index, status: :unprocessable_entity
      end
    end

    def move
      position_data = params.fetch(:positions, {})

      position_data.each do |document_id, position|
        document = @product.product_documents.find(document_id)
        document.position = position
      end

      @product.save!
      flash[:success] = t(
        "workarea.admin.product_documents.flash_messages.sorting_saved"
      )
      head :ok
    end

    def destroy
      @product.product_documents.find(params[:id]).destroy
      flash[:success] = t("workarea.admin.product_documents.flash_messages.delete")
      redirect_to catalog_product_documents_path(@product)
    end

    private

      def find_product
        @product = Workarea::Admin::ProductViewModel.wrap(
          Catalog::Product.where(slug: params[:catalog_product_id]).first
        )
      end
  end
end
