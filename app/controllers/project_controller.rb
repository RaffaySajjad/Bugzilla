class ProjectController < ApplicationController
  before_action :init_project, only: %i[create]

  def show
  end

  def create
    @project = Project.new(project_params)
    @project.manager_id = current_user.id
    @project.save
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to manager_path(current_user.id)
  end

  private

  def project_params
    params.require(:project).permit(:title, :manager_id)
  end
end
