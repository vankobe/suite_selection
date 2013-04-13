class SearchController < ApplicationController
  def products
    if params[:order].present?
      if params[:order] == "score"
        order = "score DESC" 
      elsif params[:order] == "updated"
        order = "id DESC"
      end
    end
    products = Product.includes(["contents", "provider"])
    products = products.where(["shop_id = ?", params[:shop_id]]) if params[:shop_id].present?
    products = products.where(["product_contents.category_id = ?", params[:category_id]]) if params[:category_id].present?
    products = products.where(["product_contents.type_id = ?", params[:type_id]]) if params[:type_id].present?
    products = products.where(["product_contents.flavor_id = ?", params[:flavor_id]]) if params[:flavor_id].present?
    products = products.order(order) if order.present?
    @products = products.page(params[:page]).per(10)
    
    @shops = Shop.all
    @types = ProductType.all
    @flavors = Flavor.all
  end

  def shops
    shops = Shop.where(["name like ?", "%#{params[:name]}%"])
    @shops = shops.page(params[:page]).per(10)
  end
end
