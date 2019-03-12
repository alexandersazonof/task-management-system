class HomeController < ApplicationController
  def index
    @tasks = current_user.tasks.order(:sort)
  end
end
