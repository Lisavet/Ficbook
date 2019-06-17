class ChaptersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_chapter, only: [:show, :edit, :update, :destroy]

  # GET /chapters
  # GET /chapters.json
  def index
    @chapters = Chapter.all
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
  end

  # GET /chapters/1/edit
  def edit
  end

  # POST /chapters
  # POST /chapters.json
  def create

    @chapter = Chapter.new(chapter_params)

      if @chapter.save
        redirect_to @chapter, notice: 'Chapter was successfully created.'
      else
        render :new
      end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
      if @chapter.update(chapter_params)
        redirect_to @chapter, notice: 'Chapter was successfully updated.'
      else
        render :edit
      end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter.destroy
    redirect_to chapters_url, notice: 'Chapter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:index, :title, :body, :fanfic_id)
    end
end
