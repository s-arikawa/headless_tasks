# frozen_string_literal: true

# タスクを操作するController
class TasksController < ApplicationController
  # GET /tasks
  def index
    use_case = TasksUseCases::List.new
    @tasks   = use_case.all_tasks
  end

  # GET /tasks/:id
  def show
    id    = params[:id]
    @task = Task.find(id)
  end

  # POST /tasks
  def create
    use_case = TasksUseCases::Create.new
    @task    = use_case.create_task(task_params)
    render :show
  end

  # PATCH, PUT /tasks/:id
  def update; end

  # DELETE /tasks/:id
  def destroy
    id       = params[:id]
    use_case = TasksUseCases::Delete.new
    use_case.task_delete(id)
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end
end
