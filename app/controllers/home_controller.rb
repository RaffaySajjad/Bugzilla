# frozen_string_literal: true

# Home's controller
class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.manager?
      render '../views/manager/index.html.erb'
    end
    if current_user.developer?
      render '../views/developer/index.html.erb'
    end
    if current_user.quality_assurance?
      render '../views/qa/index.html.erb'
    end
  end
end
