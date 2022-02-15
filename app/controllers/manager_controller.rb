# frozen_string_literal: true

# Manager's home controller
class ManagerController < ApplicationController
  before_action :manager_projects, only: %i[show]
  before_action :emp_working_on_project, only: %i[addtoproject deletefromproject]

  def show; end

  def create; end

  def addusers
    @project_id = params[:id]
    @project = Project.find_by_id(@project_id)
    @active_employees_id = ProjectUser.where(project_id: @project_id).pluck(:user_id)
    @selected_users = User.where(id: @active_employees_id)
    @employees = User.where.not(user_type: 'Manager').where.not(id: @selected_users)
  end

  def add_to_project
    @project_id = params[:pid]

    if @record.blank?
      @add_user = ProjectUser.new
      @add_user.project_id = @project_id
      @add_user.user_id = @emp_id
      @add_user.save
    end

    respond_to do |format|
      format.html { redirect_to request.referer }
    end
  end

  def delete_from_project
    @project_id = params[:pid]
    @record.destroy_all

    respond_to do |format|
      format.html { redirect_to request.referer}
    end
  end

  private

  def manager_projects
    @projects = Project.where(manager_id: current_user.id)
  end
end
