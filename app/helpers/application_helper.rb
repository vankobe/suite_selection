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
end
