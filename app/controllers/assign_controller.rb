class AssignController < ActionController::Base
  def show
    @project_id = params[:id]
    @bugs = Bug.where(project_id: @project_id).where.not(assignee_id: current_user.id)
    @my_bugs = Bug.where(project_id: @project_id, assignee_id: current_user.id)
  end
  
end
