class Admin::ProvidersController < AdminController
  def update
    @provider = Provider.where(["id = ?", params[:provider][:id]]).first || Provider.new
    @provider.name = params[:provider][:name]
    @provider.url = params[:provider][:url]
    @provider.country_id = params[:provider][:country_id]
    @provider.price_currency = params[:provider][:price_currency]
    @provider.price_cents = params[:provider][:price_cents]
    @provider.on_sale_flg = params[:provider][:on_sale_flg]
    respond_to do |format|
      if @provider.save
        format.html { redirect_to admin_provider_url }
        format.js
        format.json { render json: @provider, status: :updated, location: @provider }
      else
        format.html { render action: edit_admin_product_url(@provider.product_id) }
        format.json { render json: @provider.errors, status: :unprocessable_entity }
      end
    end
  end
end
