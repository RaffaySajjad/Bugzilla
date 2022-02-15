class ProjectController < ApplicationController
  def show
    @project_id = params[:id]
    @project = Project.find_by_id(@project_id)
    @active_employees_id = ProjectUser.where(project_id: @project_id).pluck(:user_id)
    @selected_users = User.where(id: @active_employees_id)
    @employees = User.where.not(user_type: 'Manager').where.not(id: @selected_users)
    # redirect_to manager_path(pid: @project_id)
  end

  def index
    @manager_id = params[:manager_id]

  end

  def create
    @manager_id = params[:manager_id]
    @project = Project.new(project_params)
    @project.manager_id = current_user.id
    @project.save

    redirect_to manager_path(id: @manager_id)
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
