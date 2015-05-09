class ProductsController < ApplicationController
  respond_to :html
  def new
    @product = Product.new
  end

  def create

    @product = Product.create(product_params)
    if @product.save!
      respond_with @product
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to root_path
    end
  end

  def show
    @product = Product.find(params[:id]) unless @product.present?

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      respond_with(@product)
    end
  end

  def index

    if params.has_key?(:cat)
      tags = params[:cat].split(',')
      @products = @products.tagged_with([tags],:on => :cat, :any => true)
    else
      @products = Product.all
    end

  end


  private

  def product_params
    params.require(:product).permit(:title, :description, :pic, :quantity, :cost)
  end
end
