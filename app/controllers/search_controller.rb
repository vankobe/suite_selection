class SearchController < ApplicationController
  def products
    conds

    @products = Product.where(conds)
  end

  def shops
  end
end
