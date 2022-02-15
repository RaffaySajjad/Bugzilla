class ExploreController < ApplicationController
  def index
    @task = Bug.find_by_id(params[:developer_id])
    @reporter = User.find_by_id(@task.creator_id)

    @status = {}
    @status[0] = 'New'
    @status[1] = 'Started'
    @status[2] = @task.bug_type == 'Bug' ? :Resolved : :Completed
  end

  def show
    @task = Bug.find_by_id(params[:id])
    @reporter = User.find_by_id(@task.creator_id)

    @status = {}
    @status[0] = 'New'
    @status[1] = 'Started'
    @status[2] = @task.bug_type == 'Bug' ? :Resolved : :Completed
  end

  def create
    @bugs = Bug.find_by(id: params[:developer_id]).update(assignee_id: current_user.id)
    @bug = Bug.find_by_id(params[:bug][:bug_id]).update(status: params[:bug][:status])
    # redirect_to new_developer_path(pid: $project_id)
  end
end
