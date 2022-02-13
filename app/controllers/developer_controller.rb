# frozen_string_literal: true

# Developer's home controller
class DeveloperController < ApplicationController
  def show
    @developer_project_ids = ProjectUser.where(user_id: current_user.id).pluck(:project_id)
    @my_projects = Project.where(id: @developer_project_ids)
  end

  def new
    $project_id = params[:pid]
    @bugs = Bug.where(project_id: $project_id).where.not(assignee_id: current_user.id)

    @my_bugs = Bug.where(project_id: $project_id, assignee_id: current_user.id)
  end

  def index
    @bug_id = params[:bid]
    @bugs = Bug.find_by(id: @bug_id)
    @bugs.update(assignee_id: current_user.id)
    @bugs.save
    redirect_to new_developer_path(pid: $project_id, bid: @bugs)
  end

  def explore
    @task = Bug.find_by_id(params[:id])
    @reporter = User.find_by_id(@task.creator_id)

    # enum status: { New: 0, Started: 1, Completed: 2, Resolved: 3 }
    @status = {}
    @status[0] = 'New'
    @status[1] = 'Started'
    @status[2] = @task.bug_type == 'Bug' ? :Resolved : :Completed
  end

  def create
    @bug = Bug.find_by_id(params[:bug][:bug_id])
    @bug.status = params[:bug][:status]
    @bug.save
    redirect_to new_developer_path(pid: $project_id)
  end
end
