class ShopLinksController < ApplicationController
  # GET /shop_links
  # GET /shop_links.json
  def index
    @shop_links = ShopLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shop_links }
    end
  end

  # GET /shop_links/1
  # GET /shop_links/1.json
  def show
    @shop_link = ShopLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop_link }
    end
  end

  # GET /shop_links/new
  # GET /shop_links/new.json
  def new
    @shop_link = ShopLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop_link }
    end
  end

  # GET /shop_links/1/edit
  def edit
    @shop_link = ShopLink.find(params[:id])
  end

  # POST /shop_links
  # POST /shop_links.json
  def create
    @shop_link = ShopLink.new(params[:shop_link])

    respond_to do |format|
      if @shop_link.save
        format.html { redirect_to @shop_link, notice: 'Shop link was successfully created.' }
        format.json { render json: @shop_link, status: :created, location: @shop_link }
      else
        format.html { render action: "new" }
        format.json { render json: @shop_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shop_links/1
  # PUT /shop_links/1.json
  def update
    @shop_link = ShopLink.find(params[:id])

    respond_to do |format|
      if @shop_link.update_attributes(params[:shop_link])
        format.html { redirect_to @shop_link, notice: 'Shop link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_links/1
  # DELETE /shop_links/1.json
  def destroy
    @shop_link = ShopLink.find(params[:id])
    @shop_link.destroy

    respond_to do |format|
      format.html { redirect_to shop_links_url }
      format.json { head :no_content }
    end
  end
end
