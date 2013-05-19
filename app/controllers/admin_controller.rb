class AdminController < ApplicationController
  def products
    products = Product.includes(["contents", "providers"]).find_published
    if params[:order].present?
      if params[:order] == "score"
        order = "score DESC"
      elsif params[:order] == "updated"
        order = "id DESC"
      end
    end

    if params[:published]
      products = Product.includes(["contents", "providers"]).find_published
    elsif params[:unpublishe]
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
    products = products.order(order) if order.present?
    @products = products.page(params[:page]).per(10)

    @categories = ProductCategory.all
    @types = ProductType.all
    @flavors = products.map(&:contents).flatten.map(&:flavor).uniq

    # 検索結果表示部
    @category_name = ProductCategory.find_by_id(params[:category_id].to_i).try(&:name)
    @type_name = ProductType.find_by_id(params[:type_id].to_i).try(&:name)
    @flavor_name = Flavor.find_by_id(params[:flavor_id].to_i).try(&:name)
    @shop_name = params[:search_shop].to_s
    @product_count = products.size
  end

  def shops
  end
end
