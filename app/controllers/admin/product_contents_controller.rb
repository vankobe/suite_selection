class Admin::ProductContentsController < AdminController
before_filter :unpublish_pages, except: :update
  def update
    @content = ProductContent.where(["id = ?", params[:product_content][:id]]).first || ProductContent.new
    @content.name = params[:product_content][:name]
    @content.product_id = params[:product_content][:product_id]
    @content.category_id = params[:product_content][:category_id]
    @content.type_id = params[:product_content][:type_id]
    @content.flavor_id = params[:product_content][:flavor_id]
    @content.quantity = params[:product_content][:quantity]
    respond_to do |format|
      if @content.save
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
