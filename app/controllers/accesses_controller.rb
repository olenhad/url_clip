class AccessesController < ApplicationController
  before_action :set_access, only: [:show, :edit, :update, :destroy]

  # GET /accesses
  # GET /accesses.json
  def index
    @accesses = Access.all
  end

  # GET /accesses/1
  # GET /accesses/1.json
  def show
  end

  # GET /accesses/new
  def new
    @access = Access.new
  end

  # GET /accesses/1/edit
  def edit
  end

  # POST /accesses
  # POST /accesses.json
  def create
    @access = Access.new(access_params)

    respond_to do |format|
      if @access.save
        format.html { redirect_to @access, notice: 'Access was successfully created.' }
        format.json { render action: 'show', status: :created, location: @access }
      else
        format.html { render action: 'new' }
        format.json { render json: @access.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accesses/1
  # PATCH/PUT /accesses/1.json
  def update
    respond_to do |format|
      if @access.update(access_params)
        format.html { redirect_to @access, notice: 'Access was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @access.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accesses/1
  # DELETE /accesses/1.json
  def destroy
    @access.destroy
    respond_to do |format|
      format.html { redirect_to accesses_url }
      format.json { head :no_content }
    end
  end

  def goto
    r = ShortUrl.find_by :short_url => params[:short_url]
    if r.nil?
      render :file => "public/404.html",  :status => 404
    else
      redirect_to r.original_url
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_access
      @access = Access.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def access_params
      params.require(:access).permit(:url_id, :access_time, :ip_addr)
    end
end
