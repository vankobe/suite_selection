#encoding: utf-8
class ShopReviewsController < ApplicationController
  # GET /shop_reviews
  # GET /shop_reviews.json
  def index
    @shop_reviews = ShopReview.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shop_reviews }
    end
  end

  # GET /shop_reviews/1
  # GET /shop_reviews/1.json
  def show
    @shop_review = ShopReview.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop_review }
    end
  end

  # GET /shop_reviews/new
  # GET /shop_reviews/new.json
  def new
    @shop_review = ShopReview.new
    if params[:shop_id].blank?
      raise 'shop_idがありません'
    end
    @shop_id = params[:shop_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shop_review }
    end
  end

  # GET /shop_reviews/1/edit
  def edit
    @shop_review = ShopReview.find(params[:id])
  end

  # POST /shop_reviews
  # POST /shop_reviews.json
  def create
    raise '画像を選択してください' if params[:shop_review_image].blank?
    shop_review = ShopReview.new(params[:shop_review])
    Shop.transaction do
      shop_review.save!
      ShopReviewImage.save_from_image_file(params[:shop_review_image], shop_review)
    end

    respond_to do |format|
      format.html { redirect_to :controller => "shops", :action => "preview", :shop_review_id => shop_review.id }
#      format.json { render json: shop_review, status: :created, location: shop_review }
    end
  end

  # PUT /shop_reviews/1
  # PUT /shop_reviews/1.json
  def update
    @shop_review = ShopReview.find(params[:id])

    respond_to do |format|
      if @shop_review.update_attributes(params[:shop_review])
        format.html { redirect_to @shop_review, notice: 'Shop review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop_review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_reviews/1
  # DELETE /shop_reviews/1.json
  def destroy
    @shop_review = ShopReview.find(params[:id])
    @shop_review.destroy

    respond_to do |format|
      format.html { redirect_to shop_reviews_url }
      format.json { head :no_content }
    end
  end
end
