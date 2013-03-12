class ProductLinksController < ApplicationController
  # GET /product_links
  # GET /product_links.json
  def index
    @product_links = ProductLink.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_links }
    end
  end

  # GET /product_links/1
  # GET /product_links/1.json
  def show
    @product_link = ProductLink.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_link }
    end
  end

  # GET /product_links/new
  # GET /product_links/new.json
  def new
    @product_link = ProductLink.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_link }
    end
  end

  # GET /product_links/1/edit
  def edit
    @product_link = ProductLink.find(params[:id])
  end

  # POST /product_links
  # POST /product_links.json
  def create
    @product_link = ProductLink.new(params[:product_link])

    respond_to do |format|
      if @product_link.save
        format.html { redirect_to @product_link, notice: 'Product link was successfully created.' }
        format.json { render json: @product_link, status: :created, location: @product_link }
      else
        format.html { render action: "new" }
        format.json { render json: @product_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_links/1
  # PUT /product_links/1.json
  def update
    @product_link = ProductLink.find(params[:id])

    respond_to do |format|
      if @product_link.update_attributes(params[:product_link])
        format.html { redirect_to @product_link, notice: 'Product link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_links/1
  # DELETE /product_links/1.json
  def destroy
    @product_link = ProductLink.find(params[:id])
    @product_link.destroy

    respond_to do |format|
      format.html { redirect_to product_links_url }
      format.json { head :no_content }
    end
  end
end
