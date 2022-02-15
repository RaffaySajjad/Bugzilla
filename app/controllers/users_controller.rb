class UsersController < ApplicationController
  def index; end

  def show
    @project_id = params[:project_id]
    @emp_id = params[:id]
    @add_user = ProjectUser.new
    @add_user.project_id = @project_id
    @add_user.user_id = @emp_id
    @add_user.save

    respond_to do |format|
      format.html { redirect_to request.referer }
    end
  end

  def destroy
    @project_id = params[:project_id]
    @emp_id = params[:id]

    @record = ProjectUser.where(project_id: @project_id, user_id: @emp_id)
    @record.destroy_all
    respond_to do |format|
      format.html { redirect_to request.referer }
    end
  end
end
