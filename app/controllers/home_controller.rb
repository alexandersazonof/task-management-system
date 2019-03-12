class HomeController < ApplicationController
  def index
    if user_signed_in?
      @tasks = current_user.tasks.order(:sort)
    end
  end
end
