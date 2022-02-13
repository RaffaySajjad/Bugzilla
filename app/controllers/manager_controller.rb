# frozen_string_literal: true

# Manager's home controller
class ManagerController < ApplicationController
  def show
    @projects = Project.where(manager_id: current_user.id)
  end

  def create
  end

  def addusers
    @project_id = params[:id]

    # @project = Project.where(project_id: @project_id)
    @project = Project.find_by_id(@project_id)
    @employees = User.where.not(user_type: 'Manager')
  end

  def addtoproject
    @emp_id = params[:eid]
    @project_id = params[:pid]

    @record = ProjectUser.where(project_id: @project_id, user_id: @emp_id)

    if(@record.blank?)
      @add_user = ProjectUser.new
      @add_user.project_id = @project_id
      @add_user.user_id = @emp_id
      @add_user.save
    end
    render '../views/manager/addeduser.html.erb'
  end

  def deletefromproject
    @emp_id = params[:eid]
    @project_id = params[:pid]
    @record = ProjectUser.where(:project_id => @project_id, :user_id => @emp_id)
    @record.destroy_all
  end
end
