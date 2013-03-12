class ShopJpsController < ApplicationController
  # GET /shop_jps
  # GET /shop_jps.json
  def index
    @shop_jps = ShopJp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shop_jps }
    end
  end

  # GET /shop_jps/1
  # GET /shop_jps/1.json
  def show
    @shop_jp = ShopJp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shop_jp }
    end
  end

  # GET /shop_jps/new
  # GET /shop_jps/new.json
  def new
    @shop    = Shop.new
    @shop_jp = ShopJp.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /shop_jps/1/edit
  def edit
    @shop_jp = ShopJp.find(params[:id])
  end

  # POST /shop_jps
  # POST /shop_jps.json
  def create
    @shop_jp = ShopJp.new(params[:shop_jp])

    respond_to do |format|
      if @shop_jp.save
        format.html { redirect_to @shop_jp, notice: 'Shop jp was successfully created.' }
        format.json { render json: @shop_jp, status: :created, location: @shop_jp }
      else
        format.html { render action: "new" }
        format.json { render json: @shop_jp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shop_jps/1
  # PUT /shop_jps/1.json
  def update
    @shop_jp = ShopJp.find(params[:id])

    respond_to do |format|
      if @shop_jp.update_attributes(params[:shop_jp])
        format.html { redirect_to @shop_jp, notice: 'Shop jp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shop_jp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shop_jps/1
  # DELETE /shop_jps/1.json
  def destroy
    @shop_jp = ShopJp.find(params[:id])
    @shop_jp.destroy

    respond_to do |format|
      format.html { redirect_to shop_jps_url }
      format.json { head :no_content }
    end
  end
end
