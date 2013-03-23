module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def shops_path
    {:controller => "shops", :action => "index"}
  end

  def edit_shop_path(shop_id)
    {:controller => "shops", :action => "edit", :id => shop_id}
  end

  def new_shop_path
    {:controller => "shops", :action => "new"}
  end

  def shop_path(shop_id)
    {:controller => "shops", :action => "show", :id => shop_id}
  end

  def delete_shop_path(shop_id)
    {:controller => "shops", :action => "destroy", :id => shop_id}
  end
 
  def shop_reviews_path
    {:controller => "shop_reviews", :action => "index"}
  end

  def edit_shop_review_path(shop_review_id)
    {:controller => "shop_reviews", :action => "edit", :id => shop_review_id}
  end

  def new_shop_review_path
    {:controller => "shop_reviews", :action => "new"}
  end

  def shop_review_path(shop_review_id)
    {:controller => "shop_reviews", :action => "show", :id => shop_review_id}
  end

  def delete_shop_review_path(shop_review_id)
    {:controller => "shop_reviews", :action => "destroy", :id => shop_review_id}
  end

  def products_path
    {:controller => "products", :action => "index"}
  end

  def edit_product_path(product_id)
    {:controller => "products", :action => "edit", :id => product_id}
  end

  def new_product_path
    {:controller => "products", :action => "new"}
  end

  def product_path(product_id)
    {:controller => "products", :action => "show", :id => product_id}
  end

  def delete_product_path(product_id)
    {:controller => "products", :action => "destroy", :id => product_id}
  end

  def reviews_path
    {:controller => "reviews", :action => "index"}
  end

  def edit_review_path(review_id)
    {:controller => "reviews", :action => "edit", :id => review_id}
  end

  def new_review_path
    {:controller => "reviews", :action => "new"}
  end

  def review_path(review_id)
    {:controller => "reviews", :action => "show", :id => review_id}
  end

  def delete_review_path(review_id)
    {:controller => "reviews", :action => "destroy", :id => review_id}
  end

#  def product_types_path
#    {:controller => "product_types", :action => "index"}
#  end
#
#  def edit_product_type_path(product_type_id)
#    {:controller => "product_types", :action => "edit", :id => product_type_id}
#  end
#
#  def new_product_type_path
#    {:controller => "product_types", :action => "new"}
#  end
#
#  def product_type_path(product_type_id)
#    {:controller => "product_types", :action => "show", :id => product_type_id}
#  end
#
#  def delete_product_type_path(product_type_id)
#    {:controller => "product_types", :action => "destroy", :id => product_type_id}
#  end
#
#  def flavors_path
#    {:controller => "flavors", :action => "index"}
#  end
#
#  def edit_flavor_path(flavor_id)
#    {:controller => "flavors", :action => "edit", :id => flavor_id}
#  end
#
#  def new_flavor_path
#    {:controller => "flavors", :action => "new"}
#  end
#
#  def flavor_path(flavor_id)
#    {:controller => "flavors", :action => "show", :id => flavor_id}
#  end
#
#  def delete_flavor_path(flavor_id)
#    {:controller => "flavors", :action => "destroy", :id => flavor_id}
#  end
end
