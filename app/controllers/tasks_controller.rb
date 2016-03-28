class TasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new
    @task.name = params[:task][:name]
    @task.user_id = current_user.id

    if @task.save
      flash[:notice] = 'Task was saved.'
      redirect_to tasks_path
    else
      flash.now[:alert] = 'There was an error saving the task. Please try again.'
      render :new
    end
  end

end
