class ReviewImagesController < ApplicationController
  # GET /review_images
  # GET /review_images.json
  def index
    @review_images = ReviewImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @review_images }
    end
  end

  # GET /review_images/1
  # GET /review_images/1.json
  def show
    @review_image = ReviewImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review_image }
    end
  end

  # GET /review_images/new
  # GET /review_images/new.json
  def new
    @review_image = ReviewImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review_image }
    end
  end

  # GET /review_images/1/edit
  def edit
    @review_image = ReviewImage.find(params[:id])
  end

  # POST /review_images
  # POST /review_images.json
  def create
    @review_image = ReviewImage.new(params[:review_image])

    respond_to do |format|
      if @review_image.save
        format.html { redirect_to @review_image, notice: 'Review image was successfully created.' }
        format.json { render json: @review_image, status: :created, location: @review_image }
      else
        format.html { render action: "new" }
        format.json { render json: @review_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /review_images/1
  # PUT /review_images/1.json
  def update
    @review_image = ReviewImage.find(params[:id])

    respond_to do |format|
      if @review_image.update_attributes(params[:review_image])
        format.html { redirect_to @review_image, notice: 'Review image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /review_images/1
  # DELETE /review_images/1.json
  def destroy
    @review_image = ReviewImage.find(params[:id])
    @review_image.destroy

    respond_to do |format|
      format.html { redirect_to review_images_url }
      format.json { head :no_content }
    end
  end
end
