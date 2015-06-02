class Admin::ProductsController < AdminController

  def index
    @category = Category.find(params['category_id'])
    @products = @category.products
  end

  def new
    @category = Category.find(params['category_id'])
    @product = @category.products.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to action: "index"
    else
      render :edit
    end
  end

  def create
    @category = Category.find(params['category_id'])
    @product = @category.products.new(product_params)
    if @product.save
      redirect_to action: "index"
    else
      render :new
    end
  end


  private

  def product_params
    normalized_params
    params.require(:product).permit(:name, :price, :category_id, :available_count, components: [])
  end

  def normalized_params
    if params["product"]["components"].is_a?(String)
      params["product"]["components"] = params["product"]["components"].split(",")
    end
  end
end

