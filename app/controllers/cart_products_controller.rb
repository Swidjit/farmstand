class CartProductsController < ApplicationController
  respond_to :html

  def create
    @cart_product = CartProduct.create(:user_id => params[:user_id], :product_id => params[:product_id], :product_quantity => params[:product_quantity])
    @products = CartProduct.all
    @cart_total = 0
    @products.each do |p|
      @cart_total += p.product_quantity * p.product.cost
    end
  end

  def destroy
    @product = CartProduct.find(params[:id])
    if @product.destroy
      redirect_to root_path
    end
  end

  def show
    @product = CartProduct.find(params[:id]) unless @product.present?

  end

  def edit
    @product = CartProduct.find(params[:id])
  end

  def update
    @product = CartProduct.find(params[:id])
    if @product.update_attributes(product_params)
      respond_with(@product)
    end
  end


  private

  def product_params
    params.require(:product).permit(:user, :product_id, :product_quantity)
  end
end
