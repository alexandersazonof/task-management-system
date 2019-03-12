class TasksController < ApplicationController


  def create
    @task = Task.new(name: params[:name], user_id: current_user.id)
    respond_to do |format|
      if @task.save
        format.js
        format.json {render json: @task, layout: false }
      else
        render root_path
      end
    end
  end

  def update
    @task = Task.find(params[:id])
    respond_to do |format|
      if (@task.update(state: true))
        format.js
        format.json { render json: @task, layout: false }
      end
    end
  end


end
