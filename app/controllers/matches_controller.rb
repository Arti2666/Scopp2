class MatchesController < ApplicationController
  def create
    @match = Match.new
    @match.user_id = current_user.id
    @project = Project.find(params[:project_id])
    @match.project = @project
    if @match.save
      flash[:success_modal] = "You have successfully registered!"
      redirect_to project_path(@project)
    else
      render "project/show"
    end
  end

  def destroy
    @match = Match.find_by('user_id= ? AND project_id =?', current_user.id, params[:id])
    @project = Project.find(params[:project_id])
    redirect_to projects_path if @match.destroy
  end
end
