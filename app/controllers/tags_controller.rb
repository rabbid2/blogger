class TagsController < ApplicationController
  before_action :require_admin, except: [:show, :index]

  def require_admin
    if current_user && current_user.email != "admin@example.com"
      redirect_back(fallback_location: root_path)
      return false
    end
  end

  def show
    @tag = Tag.find (params[:id])
  end

  def index
    @tags = Tag.all
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path
  end
end