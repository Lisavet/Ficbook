class ChaptersController < ApplicationController
  before_action :find_fanfic, only:[:destroy,:create,:update, :new, :show]
  before_action :find_chapter, only:[:destroy,:update]

  def new
    @chapter = Chapter.new
  end
  def create
    @chapter = @fanfic.chapters.create(chapter_params)
    if @chapter.save
      redirect_to @fanfic
    else
      render 'new'
    end
  end
  def show
    @chapter= @fanfic.chapters.find(params[:id])
  end
  def destroy
    # @chapter = @fanfic.chapters.find(params[:id])
    @chapter.destroy
    redirect_to fanfic_path(@fanfic)
  end
  def edit
    @fanfic= Fanfic.find(params[:fanfic_id])
    @chapter = @fanfic.chapters.find(params[:id])
  end
  def update
    @chapter = @fanfic.chapters.find(params[:id])
    @chapter.update_attributes(chapter_params)
    if @chapter.save
      redirect_to @fanfic
    else
      render 'edit'
    end
  end
  private
  def find_fanfic
    @fanfic = Fanfic.find(params[:fanfic_id])
  end
  def find_chapter
    @chapter = @fanfic.chapters.find(params[:id])
  end
  def chapter_params
    params.require(:chapter).permit(:body, :index, :title)
  end
end