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

  def product_thum_path(product, size)
    if product.image.present?
      image_tag product.image.thum(size.to_s + "x"+ size.to_s).url
    else
      image_tag "",size: size.to_s + "x" + size.to_s
    end
  end

  def product_content_list(product_content)
    product_content.flavor.try(:name).to_s + " " + product_content.type.try(:name).to_s + "  " + product_content.try(:name).to_s + " " + product_content.try(:quantity).to_s + t("counter.product")
  end
end
