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

  # PUT /tasks/:id/status
  def change_status
    id          = params[:id]
    dest_status = task_params[:status]&.to_s || ''
    raise(ArgumentError) unless dest_status.upcase == 'DOING'

    use_case = TasksUseCases::Patch.new
    @task = use_case.change_status_to_doing(id)
    render :show
  end

  private

  def task_params
    params.require(:task).permit(:name, :status)
  end
end
