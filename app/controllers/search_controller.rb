class SearchController < ApplicationController
  before_filter :unpublish_pages, except: :products
  INHERIT_KEYS = [ 'search_shop', 'category_id', 'type_id', 'page', 'order']
  def products
    if params[:order].present?
      if params[:order] == "score"
        order = "products.score DESC" 
      elsif params[:order] == "updated"
        order = "products.id DESC"
      end
    end

    products = Product.includes(["contents", "providers"]).find_published
    if params[:search_shop].present?
      @shop = Shop.where(["name like ?", params[:search_shop].to_s + "%"])
      products = products.where(["shop_id in (?)", @shop.map{|s| s.try(&:id)}])
    end
    products = products.where(["product_contents.category_id = ?", params[:category_id]]) if params[:category_id].present?
    products = products.where(["product_contents.type_id = ?", params[:type_id]]) if params[:type_id].present?
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
    @hash_for_link = params.dup
    @hash_for_link.select{|key, value| INHERIT_KEYS.include?(key)}
  end

  def shops
    shops = Shop.where(["name like ?", "%#{params[:name]}%"])
    @shops = shops.page(params[:page]).per(10)
  end
end
