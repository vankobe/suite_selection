module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def product_thum_path(product, size)
    if product.image.present?
      image_tag product.images.first.product_image.thumb(size.to_s + "x"+ size.to_s).url
    else
      image_tag "",size: size.to_s + "x" + size.to_s
    end
  end

  def product_content_list(product_content)
    product_content.flavor.try(:name).to_s + " " + product_content.type.try(:name).to_s  + " " + product_content.try(:quantity).to_s + t("counter.product")
  end
end
