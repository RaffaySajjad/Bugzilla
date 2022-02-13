# frozen_string_literal: true

# QA's home controller
class QaController < ApplicationController
  def show
    @qa_project_ids = ProjectUser.where(:user_id => current_user.id).pluck(:project_id)
    @my_projects = Project.where(id: @qa_project_ids)
  end

  def new
    @type = params[:type]
    $project_id = params[:pid]
    @project = Project.where(:id => $project_id).select(:title).last[:title]
    @bugs = Bug.where(creator_id: current_user.id).where(:project_id => $project_id)
  end

  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy
    redirect_to qa_path(current_user.id)
  end

  def create
    @new_request = Bug.new(params.require(:bug).permit(:project_id, :title, :assignee_id, :status,
                                                       :description, :creator_id, :deadline, :bug_type,
                                                       screenshots: []))
    @new_request.project_id = $project_id
    @new_request.creator_id = current_user.id
    @new_request.assignee_id = 0
    @new_request.status = 0
    @new_request.created_at = Time.now
    @new_request.updated_at = Time.now
    @new_request.save
    redirect_to qa_path(id: @current_user.id)
  end

  def index
    redirect_to new_qa_path(type: 'bug', pid: $project.id)
  end
end
