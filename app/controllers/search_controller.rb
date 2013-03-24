class SearchController < ApplicationController
  def products
    conds = []
    if params[:shop_id].present?
      conds += ["shop_id = ?", params[:shop_id]]
    end
    if params[:category_id].present?
      conds += ["product_contents.category_id = ?", params[:category_id]]
    end
    if params[:type_id].present?
      conds += ["product_contents.type_id = ?", params[:type_id]]
    end
    if params[:flavor_id].present?
      conds += ["product_contents.flavor_id = ?", params[:flavor_id]]
    end

    @shops = Shop.all
    @types = ProductType.all
    @flavors = Flavor.all
    @products = Product.includes("contents").where(conds)
  end

  def shops
  end
end
