class ProductJpsController < ApplicationController
  # GET /product_jps
  # GET /product_jps.json
  def index
    @product_jps = ProductJp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_jps }
    end
  end

  # GET /product_jps/1
  # GET /product_jps/1.json
  def show
    @product_jp = ProductJp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_jp }
    end
  end

  # GET /product_jps/new
  # GET /product_jps/new.json
  def new
    @product_jp = ProductJp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_jp }
    end
  end

  # GET /product_jps/1/edit
  def edit
    @product_jp = ProductJp.find(params[:id])
  end

  # POST /product_jps
  # POST /product_jps.json
  def create
    @product_jp = ProductJp.new(params[:product_jp])

    respond_to do |format|
      if @product_jp.save
        format.html { redirect_to @product_jp, notice: 'Product jp was successfully created.' }
        format.json { render json: @product_jp, status: :created, location: @product_jp }
      else
        format.html { render action: "new" }
        format.json { render json: @product_jp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_jps/1
  # PUT /product_jps/1.json
  def update
    @product_jp = ProductJp.find(params[:id])

    respond_to do |format|
      if @product_jp.update_attributes(params[:product_jp])
        format.html { redirect_to @product_jp, notice: 'Product jp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_jp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_jps/1
  # DELETE /product_jps/1.json
  def destroy
    @product_jp = ProductJp.find(params[:id])
    @product_jp.destroy

    respond_to do |format|
      format.html { redirect_to product_jps_url }
      format.json { head :no_content }
    end
  end
end
