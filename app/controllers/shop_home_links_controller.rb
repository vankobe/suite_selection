class ShopHomeLinksController < ApplicationController
  # GET /shop_home_links
  # GET /shop_home_links.json
  def index
    @shop_home_links = ShopHomeLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shop_home_links }
    end
  end

  # GET /shop_home_links/1
  # GET /shop_home_links/1.json
  def show
    @shop_home_link = ShopHomeLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop_home_link }
    end
  end

  # GET /shop_home_links/new
  # GET /shop_home_links/new.json
  def new
    @shop_home_link = ShopHomeLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop_home_link }
    end
  end

  # GET /shop_home_links/1/edit
  def edit
    @shop_home_link = ShopHomeLink.find(params[:id])
  end

  # POST /shop_home_links
  # POST /shop_home_links.json
  def create
    @shop_home_link = ShopHomeLink.new(params[:shop_home_link])

    respond_to do |format|
      if @shop_home_link.save
        format.html { redirect_to @shop_home_link, notice: 'Shop home link was successfully created.' }
        format.json { render json: @shop_home_link, status: :created, location: @shop_home_link }
      else
        format.html { render action: "new" }
        format.json { render json: @shop_home_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shop_home_links/1
  # PUT /shop_home_links/1.json
  def update
    @shop_home_link = ShopHomeLink.find(params[:id])

    respond_to do |format|
      if @shop_home_link.update_attributes(params[:shop_home_link])
        format.html { redirect_to @shop_home_link, notice: 'Shop home link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop_home_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_home_links/1
  # DELETE /shop_home_links/1.json
  def destroy
    @shop_home_link = ShopHomeLink.find(params[:id])
    @shop_home_link.destroy

    respond_to do |format|
      format.html { redirect_to shop_home_links_url }
      format.json { head :no_content }
    end
  end
end
