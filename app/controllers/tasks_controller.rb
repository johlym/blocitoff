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
    @task.completion = false
    @task.creation_datestamp = Time.now.getutc
    @task.duedate_datestamp = @task.creation_datestamp + 7.days

    if @task.save
      flash[:notice] = 'Task was saved.'
      redirect_to tasks_path
    else
      flash.now[:alert] = 'There was an error saving the task. Please try again.'
      render :new
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.name = params[:task][:name]

    if @task.save
      flash[:notice] = 'Task was updated.'
      redirect_to tasks_path
    else
      flash.now[:alert] = 'There was an error updating the task. Please try again.'
      render :edit
    end
  end

  def update_status
    @task = Task.find(params[:id])
    @task.completion = params[:status]
    if @task.save
      flash[:notice] = 'Task was updated.'
      redirect_to tasks_path
    else
      flash.now[:alert] = 'There was an error updating the task. Please try again.'
      redirect_to tasks_path
    end
  end

end
