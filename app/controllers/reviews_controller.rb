# encoding: utf-8
class ReviewsController < ApplicationController
  before_filter :only_user_allow, :only => [:new, :edit, :create]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @product_id = params[:product_id]
    @review = Review.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.json
  def create
    raise '画像を選択してください' if params[:review_image].blank?
    review = Review.new(params[:review].merge(:user_id => @user.id))
    review_content = review.build_content({:comment => params[:comment]})

    unless params[:review_image].nil?
      review_image = ReviewImage.create(:review_image => params[:review_image])
    end

    Shop.transaction do
      review.save!
      review_content.save!
      review_image.user_id = @user.id
      review_image.product_id = review.product_id
      review_image.review_id = review.id
      review_image.save!
    end

    respond_to do |format|
      format.html { redirect_to :controller => 'products', :action => "show", :id => review.product_id }
      format.json { render json: review, status: :created, location: review }
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end
end
