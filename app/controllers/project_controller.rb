class ProjectController < ApplicationController
  def show
  end

  def create
    @new_project = Project.new(params.require(:project).permit(:title, :manager_id))
    @new_project.manager_id = current_user.id
    @new_project.save
    redirect_to @new_project
  end
end
