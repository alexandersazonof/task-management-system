class TasksController < ApplicationController


  def create
    @task = Task.new(name: params[:name], user_id: current_user.id)
    respond_to do |format|
      if @task.save
        format.js
        format.json {render json: @task, layout: false}
      else
        render root_path
      end
    end
  end


  private
  def task_params
    params.permit(:name)
  end
end
