class Admin::ProductsController < AdminController
before_filter :unpublish_pages, except: [:index, :edit, :update, :publish]
  def index
    if params[:publish] == "publish"
      products = Product.includes(["contents", "providers"]).find_published
    elsif params[:publish] == "unpublish"
      products = Product.includes(["contents", "providers"]).find_unpublished
    else
      products = Product.includes(["contents", "providers"])
    end

    if params[:search_shop].present?
      @shop = Shop.where(["name like ?", params[:search_shop].to_s + "%"])
      products = products.where(["shop_id in (?)", @shop.map{|s| s.try(&:id)}])
    end
    products = products.where(["product_contents.category_id = ?", params[:category_id]]) if params[:category_id].present?
    products = products.where(["product_contents.type_id = ?", params[:type_id]]) if params[:type_id].present?
    products = products.where(["product_contents.flavor_id = ?", params[:flavor_id]]) if params[:flavor_id].present?
    @products = products.page(params[:page]).per(10)
  end

  def edit
    @product = Product.includes(["contents", "providers"]).where(["id = ?", params[:id].to_i]).first
    @contents = @product.contents
    @contents << @product.contents.build
    @contents.uniq!
    @providers = @product.providers
    @providers << @product.providers.build
    @providers.uniq!
  end

  def update
    @product = Product.where(["id = ?", params[:product][:id]]).first || Product.new
    @product.name = params[:product][:name]
    @product.expire_date = params[:product][:expire_date]
    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_url }
        format.js
        format.json { render json: @product, status: :updated, location: @product }
      else
        format.html { render action: edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def publish
    product = Product.where(["id = ?", params[:id]]).first
    product.publish!
    redirect_to admin_products_url
    return
    rescue
      redirect_to edit_admin_product_url(product.id)
  end
end
