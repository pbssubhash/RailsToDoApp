class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_filter :user_can_view_task, only: :show
  def index
    @tasks = current_user.tasks.paginate(:page => params[:page], :per_page => 2)
  end
  def show #Showing all the tasks!
    #Added _user_can_view_task so that only people who create a task can view it.

  end

  def new # Create a new task!
    @task = current_user.tasks.build
  end

  def edit # Editing a task!
  end

  def create
    @task = current_user.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was marked complete and successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
       def user_can_view_task
          @task = Task.find(params[:id])
          unless @task.user_id == current_user.id
            flash[:notice] = "You don't have permission to view this task!"
            redirect_to(tasks_path)
          end
       end

    def set_task # Set_task
      @task = Task.find(params[:id])
    end


    def task_params #Should add params here if at all in future wish to do so.
      params.require(:task).permit(:title, :whattodo)
    end
end
