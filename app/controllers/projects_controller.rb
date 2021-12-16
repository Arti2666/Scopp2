class ProjectsController < ApplicationController
  def index
    if params[:query].present?
      sql_query = " \
        title ILIKE :query \
        OR tag1 ILIKE :query \
        OR tag2 ILIKE :query \
        OR tag3 ILIKE :query \
      "
      @projects = Project.all.where(sql_query, query: "%#{params[:query]}%")
    else
      @projects = Project.includes(:user)
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save!
      redirect_to project_path(@project)
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.user == current_user
      @project.destroy!
    end
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description, :tag1, :tag2, :tag3)
  end
end
