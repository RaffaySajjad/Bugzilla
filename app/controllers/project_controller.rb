class ProjectController < ApplicationController
  def show
  end

  def create
    @new_project = Project.new(params.require(:project).permit(:title, :manager_id))
    @new_project.manager_id = current_user.id
    # byebug
    @new_project.save
    redirect_to project_path(@new_project)
  end

  def show
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to manager_path(current_user.id)
  end
end
