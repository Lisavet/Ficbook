class FanficsController < ApplicationController
  # http_basic_authenticate_with name: "admin", password: "1q2", except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_fanfic, only: [:show, :edit, :update, :destroy]

  # GET /fanfics
  # GET /fanfics.json
  def index
    @fanfics = Fanfic.paginate(page: params[:page], per_page: 10)
  end

  # GET /fanfics/1
  # GET /fanfics/1.json
  def show
    @chapters = @fanfic.chapters
  end

  # GET /fanfics/new
  def new
    @fanfic = Fanfic.new
  end

  # GET /fanfics/1/edit
  def edit
  end

  # POST /fanfics
  # POST /fanfics.json
  def create
    @fanfic = Fanfic.new(fanfic_params)

    if @fanfic.save
      redirect_to @fanfic, notice: 'Fanfic was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /fanfics/1
  # PATCH/PUT /fanfics/1.json
  def update
    if @fanfic.update(fanfic_params)
      redirect_to @fanfic, notice: 'Fanfic was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /fanfics/1
  # DELETE /fanfics/1.json
  def destroy
    @fanfic.destroy
    redirect_to fanfics_path, notice: 'Fanfic was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fanfic
      @fanfic = Fanfic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fanfic_params
      params.require(:fanfic).permit(:title, :body, :avatar, :all_tags, :genre_id)
    end
end
