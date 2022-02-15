# frozen_string_literal: true

# Developer's home controller
class DeveloperController < ApplicationController
  def show
    @developer_project_ids = ProjectUser.where(user_id: current_user.id).pluck(:project_id)
    @my_projects = Project.where(id: @developer_project_ids)
  end

  def index
    @bugs = Bug.find_by(id: params[:bid]).update(assignee_id: current_user.id)
    respond_to { |format| format.html { redirect_to request.referer } }
  end

  def create
    @bugs = Bug.find_by(id: params[:bid]).update(assignee_id: current_user.id)
    @bug = Bug.find_by_id(params[:bug][:bug_id]).update(status: params[:bug][:status])
    redirect_to new_developer_path(pid: $project_id)
  end
end
