# frozen_string_literal: true

# Manager's home controller
class ManagerController < ApplicationController
  def show
    @projects = Project.where(manager_id: current_user.id)
  end

  def create
  end
end
