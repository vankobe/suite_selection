# encoding: utf-8
class Admin::ProductContentsController < AdminController
before_filter :unpublish_pages, except: :update
  def update
    case params[:commit]
    when  "登録"
      @content = ProductContent.where(["id = ?", params[:product_content][:id]]).first || ProductContent.new
      @content.name = params[:product_content][:name]
      @content.product_id = params[:product_content][:product_id]
      @content.type_id = params[:product_content][:type_id]
      @content.category_id = ProductType.where(["id = ?", @content.type_id]).first.category_id
      @content.flavor_name = params[:product_content][:flavor_name]
      @content.quantity = params[:product_content][:quantity]
      ret = @content.save
    when "削除"
      @content = ProductContent.where(["id = ?", params[:product_content][:id]]).first
      ret = @content.try(:destroy)
    end
    respond_to do |format|
      if ret
        format.html { redirect_to admin_products_url }
        format.js
        format.json { render json: @content, status: :updated, location: @content }
      else
        format.html { redirect_to edit_admin_product_url(@content.product_id) }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end
end
