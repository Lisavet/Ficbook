class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(name: params[:id])
    @fanfics = @tag.fanfics
  end
end