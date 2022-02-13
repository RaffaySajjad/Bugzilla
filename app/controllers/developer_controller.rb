# frozen_string_literal: true

# Developer's home controller
class DeveloperController < ApplicationController
  def index
  end
  def show
    @developer_project_ids = ProjectUser.where(:user_id => current_user.id).pluck(:project_id)
    @my_projects = Project.where(id: @developer_project_ids)
  end
  def new
    $project_id = params[:pid]
    @bugs = Bug.where(:project_id => $project_id).where.not(:assignee_id => current_user.id)

    @my_bugs = Bug.where(:project_id => $project_id, :assignee_id => current_user.id)
  end

  def index
    @bug_id = params[:bid]
    @bugs = Bug.find_by(id: @bug_id)
    @bugs.update(assignee_id: current_user.id)
    @bugs.save
    redirect_to new_developer_path(pid: $project_id, bid: @bugs)
  end
end
