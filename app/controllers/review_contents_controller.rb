class ReviewContentsController < ApplicationController
  # GET /review_contents
  # GET /review_contents.json
  def index
    @review_contents = ReviewContent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @review_contents }
    end
  end

  # GET /review_contents/1
  # GET /review_contents/1.json
  def show
    @review_content = ReviewContent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review_content }
    end
  end

  # GET /review_contents/new
  # GET /review_contents/new.json
  def new
    @review_content = ReviewContent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review_content }
    end
  end

  # GET /review_contents/1/edit
  def edit
    @review_content = ReviewContent.find(params[:id])
  end

  # POST /review_contents
  # POST /review_contents.json
  def create
    @review_content = ReviewContent.new(params[:review_content])

    respond_to do |format|
      if @review_content.save
        format.html { redirect_to @review_content, notice: 'Review content was successfully created.' }
        format.json { render json: @review_content, status: :created, location: @review_content }
      else
        format.html { render action: "new" }
        format.json { render json: @review_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /review_contents/1
  # PUT /review_contents/1.json
  def update
    @review_content = ReviewContent.find(params[:id])

    respond_to do |format|
      if @review_content.update_attributes(params[:review_content])
        format.html { redirect_to @review_content, notice: 'Review content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /review_contents/1
  # DELETE /review_contents/1.json
  def destroy
    @review_content = ReviewContent.find(params[:id])
    @review_content.destroy

    respond_to do |format|
      format.html { redirect_to review_contents_url }
      format.json { head :no_content }
    end
  end
end
