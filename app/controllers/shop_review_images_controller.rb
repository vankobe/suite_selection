class ShopReviewImagesController < ApplicationController
  # GET /shop_review_images
  # GET /shop_review_images.json
  def index
    @shop_review_images = ShopReviewImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shop_review_images }
    end
  end

  # GET /shop_review_images/1
  # GET /shop_review_images/1.json
  def show
    @shop_review_image = ShopReviewImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop_review_image }
    end
  end

  # GET /shop_review_images/new
  # GET /shop_review_images/new.json
  def new
    @shop_review_image = ShopReviewImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop_review_image }
    end
  end

  # GET /shop_review_images/1/edit
  def edit
    @shop_review_image = ShopReviewImage.find(params[:id])
  end

  # POST /shop_review_images
  # POST /shop_review_images.json
  def create
    @shop_review_image = ShopReviewImage.new(params[:shop_review_image])

    respond_to do |format|
      if @shop_review_image.save
        format.html { redirect_to @shop_review_image, notice: 'Shop review image was successfully created.' }
        format.json { render json: @shop_review_image, status: :created, location: @shop_review_image }
      else
        format.html { render action: "new" }
        format.json { render json: @shop_review_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shop_review_images/1
  # PUT /shop_review_images/1.json
  def update
    @shop_review_image = ShopReviewImage.find(params[:id])

    respond_to do |format|
      if @shop_review_image.update_attributes(params[:shop_review_image])
        format.html { redirect_to @shop_review_image, notice: 'Shop review image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop_review_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_review_images/1
  # DELETE /shop_review_images/1.json
  def destroy
    @shop_review_image = ShopReviewImage.find(params[:id])
    @shop_review_image.destroy

    respond_to do |format|
      format.html { redirect_to shop_review_images_url }
      format.json { head :no_content }
    end
  end
end
