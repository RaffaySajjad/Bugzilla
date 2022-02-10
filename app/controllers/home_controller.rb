# frozen_string_literal: true

# Home's controller
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.manager?
      redirect_to manager_path(current_user.id)
    end
    if current_user.developer?
      redirect_to developer_path(current_user.id)
    end
    if current_user.quality_assurance?
      redirect_to qa_path(current_user.id)
    end
  end
end
