# frozen_string_literal: true

# Manager's home controller
class ManagerController < ApplicationController
  before_action :manager_projects, only: %i[show]
  before_action :emp_working_on_project, only: %i[addtoproject deletefromproject]

  def show
  end

  def create
  end

  def addusers
    @project_id = params[:id]
    @project = Project.find_by_id(@project_id)
    @employees = User.where.not(user_type: 'Manager')
  end

  def addtoproject
    if @record.blank?
      @add_user = ProjectUser.new
      @add_user.project_id = @project_id
      @add_user.user_id = @emp_id
      @add_user.save
    end
    render '../views/manager/addeduser.html.erb'
  end

  def deletefromproject
    @record.destroy_all
  end

  private

  def manager_projects
    @projects = Project.where(manager_id: current_user.id)
  end

  def emp_working_on_project
    @emp_id = params[:eid]
    @project_id = params[:pid]
    @record = ProjectUser.where(project_id: @project_id, user_id: @emp_id)
  end
end
