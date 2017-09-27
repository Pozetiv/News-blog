class AddpostsController < ApplicationController
  before_action :set_addpost, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :destroy]

  # GET /addposts
  # GET /addposts.json
  def index
    @addposts = Addpost.all
  end

  # GET /addposts/1
  # GET /addposts/1.json
  def show
  end

  # GET /addposts/new
  def new
    @addpost = Addpost.new
  end

  # GET /addposts/1/edit
  def edit
  end

  # POST /addposts
  # POST /addposts.json
  def create
    @addpost = Addpost.new(addpost_params)

    respond_to do |format|
      if @addpost.save
        format.html { redirect_to @addpost, notice: 'Addpost was successfully created.' }
        format.json { render :show, status: :created, location: @addpost }
      else
        format.html { render :new }
        format.json { render json: @addpost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addposts/1
  # PATCH/PUT /addposts/1.json


  # DELETE /addposts/1
  # DELETE /addposts/1.json
  def destroy
    @addpost.destroy
    respond_to do |format|
      format.html { redirect_to addposts_url, notice: 'Addpost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_addpost
      @addpost = Addpost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def addpost_params
      params.require(:addpost).permit(:title, :body, :text)
    end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:info] = "Please log in"
      redirect_to login_url
    end
  end
end
