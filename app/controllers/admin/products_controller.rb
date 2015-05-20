class Admin::ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to action: "index"
    else
      render :new
    end
  end


  private

  def product_params
    params.require(:product).permit(:name, :price, :components, :category_id, :available_count)
  end
end
