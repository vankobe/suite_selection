class CountryJpsController < ApplicationController
  # GET /country_jps
  # GET /country_jps.json
  def index
    @country_jps = CountryJp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @country_jps }
    end
  end

  # GET /country_jps/1
  # GET /country_jps/1.json
  def show
    @country_jp = CountryJp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @country_jp }
    end
  end

  # GET /country_jps/new
  # GET /country_jps/new.json
  def new
    @country_jp = CountryJp.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @country_jp }
    end
  end

  # GET /country_jps/1/edit
  def edit
    @country_jp = CountryJp.find(params[:id])
  end

  # POST /country_jps
  # POST /country_jps.json
  def create
    @country_jp = CountryJp.new(params[:country_jp])

    respond_to do |format|
      if @country_jp.save
        format.html { redirect_to @country_jp, notice: 'Country jp was successfully created.' }
        format.json { render json: @country_jp, status: :created, location: @country_jp }
      else
        format.html { render action: "new" }
        format.json { render json: @country_jp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /country_jps/1
  # PUT /country_jps/1.json
  def update
    @country_jp = CountryJp.find(params[:id])

    respond_to do |format|
      if @country_jp.update_attributes(params[:country_jp])
        format.html { redirect_to @country_jp, notice: 'Country jp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @country_jp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /country_jps/1
  # DELETE /country_jps/1.json
  def destroy
    @country_jp = CountryJp.find(params[:id])
    @country_jp.destroy

    respond_to do |format|
      format.html { redirect_to country_jps_url }
      format.json { head :no_content }
    end
  end
end
