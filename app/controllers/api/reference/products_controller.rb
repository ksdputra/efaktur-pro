module Api
  module Reference
    class ProductsController < Api::BaseController
      before_action :set_product, only: %i[show update destroy]

      def index
        render json: IndexFacade.new(current_user.id, Product, params).call, status: 200
      end

      def dropdown
        products = current_user.products.where(is_dropdown: true).show_dropdown
        render json: { object: products }, status: 200
      end

      def create
        current_user.products.create!(product_params)
        render json: { status: 'OK', message: 'Barang/Jasa berhasil ditambahkan.' }, status: 201
      end

      def show
        render json: { object: @product }, status: 200
      end

      def update
        @product.update!(product_params)
        render json: { status: 'OK', message: 'Barang/Jasa berhasil diperbaharui.' }, status: 200
      end

      def destroy
        @product.destroy!
        head 204
      end

      private

      def set_product
        @product = current_user.products.find(params[:id])
      end

      def product_params
        params.permit(:code, :name, :price, :is_dropdown)
      end
    end
  end
end
